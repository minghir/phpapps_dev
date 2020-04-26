import {Text} from "@codemirror/next/text"

const empty: readonly any[] = []

/// Distinguishes different ways in which positions can be mapped.
export enum MapMode {
  /// Map a position to a valid new position, even when its context
  /// was deleted.
  Simple,
  /// Return -1 if a deletion happens across the position.
  TrackDel,
  /// Return -1 if the character _before_ the position is deleted.
  TrackBefore,
  /// Return -1 if the character _after_ the position is deleted.
  TrackAfter
}

/// Interface for things that support position mapping.
export interface Mapping {
  /// Map a given position through a set of changes.
  ///
  /// `assoc` indicates which side the position should be associated
  /// with. When it is negative or zero, the mapping will try to keep
  /// the position close to the character before it (if any), and will
  /// move it before insertions at that point or replacements across
  /// that point. When it is positive, the position is associated with
  /// the character after it, and will be moved forward for insertions
  /// at or replacements across the position. Defaults to -1.
  ///
  /// `mode` determines whether deletions should be
  /// [reported](#state.MapMode). It defaults to `MapMode.Simple`
  /// (don't report deletions).
  mapPos(pos: number, assoc?: number, mode?: MapMode): number
}

/// A change description describes a document change. This is usually
/// used as a superclass of [`Change`](#state.Change), but can be used
/// to store change data without storing the replacement string
/// content.
export class ChangeDesc implements Mapping {
  /// Create a description that replaces the text between positions
  /// `from` and `to` with a new string of length `length`.
  constructor(
    /// The start position of the change.
    public readonly from: number,
    /// The end of the change (as a pre-change document position).
    public readonly to: number,
    /// The length of the replacing content.
    public readonly length: number
  ) {}

  /// Get the change description of the inverse of this change.
  get invertedDesc() { return new ChangeDesc(this.from, this.from + this.length, this.to - this.from) }

  /// @internal
  mapPos(pos: number, assoc: number = -1, mode: MapMode = MapMode.Simple): number {
    let {from, to, length} = this
    if (pos < from) return pos
    if (pos > to) return pos + (length - (to - from))
    if (pos == to || pos == from) {
      if (from < pos && mode == MapMode.TrackBefore || to > pos && mode == MapMode.TrackAfter) return -1
      return (from == to ? assoc <= 0 : pos == from) ? from : from + length
    }
    pos = from + (assoc <= 0 ? 0 : length)
    return mode != MapMode.Simple ? -1 : pos
  }

  /// @internal
  toString() { return `${this.from}-${this.to}:${this.length}` }

  /// Return a JSON-serializeable object representing this value.
  toJSON(): any { return this }

  /// Create a change description from its JSON representation.
  static fromJSON(json: any) {
    if (!json || typeof json.from != "number" || typeof json.to != "number" || typeof json.length != "number")
      throw new RangeError("Invalid JSON representation for ChangeDesc")
    return new ChangeDesc(json.from, json.to, json.length)
  }
}

/// Change objects describe changes to the document.
export class Change extends ChangeDesc {
  /// Create a change that replaces `from` to `to` with `text`. The
  /// text is given as an array of lines. When it doesn't span lines,
  /// the array has a single element. When it does, a new element is
  /// added for every line. It should never have zero elements.
  constructor(
    public readonly from: number,
    public readonly to: number,
    /// The replacement content.
    public readonly text: readonly string[]
  ) {
    super(from, to, textLength(text))
  }

  /// Create the inverse of this change when applied to the given
  /// document. `change.invert(doc).apply(change.apply(doc))` gets you
  /// the same document as the original `doc`.
  invert(doc: Text): Change {
    return new Change(this.from, this.from + this.length, doc.sliceLines(this.from, this.to))
  }

  /// Apply this change to the given content, returning an updated
  /// version of the document.
  apply(doc: Text): Text {
    return doc.replace(this.from, this.to, this.text)
  }

  /// Map this change through a mapping, producing a new change that
  /// can be applied to a post-mapping document. May return null if
  /// the mapping completely replaces the region this change would
  /// apply to.
  map(mapping: Mapping): Change | null {
    if (this.from == this.to) {
      let pos = mapping.mapPos(this.from, 1, MapMode.TrackDel)
      return pos == this.from ? this : pos < 0 ? null : new Change(pos, pos, this.text)
    } else {
      let from = mapping.mapPos(this.from, 1), to = mapping.mapPos(this.to, -1)
      return from >= to ? null : new Change(from, to, this.text)
    }
  }

  /// A change description for this change.
  get desc() { return new ChangeDesc(this.from, this.to, this.length) }

  /// Produce a JSON-serializable object representing this change.
  toJSON(): any {
    return {from: this.from, to: this.to, text: this.text}
  }

  /// Read a change instance from its JSON representation.
  static fromJSON(json: any) {
    if (!json || typeof json.from != "number" || typeof json.to != "number" ||
        !Array.isArray(json.text) || json.text.length == 0 || json.text.some((val: any) => typeof val != "string"))
      throw new RangeError("Invalid JSON representation for Change")
    return new Change(json.from, json.to, json.text)
  }
}

function textLength(text: readonly string[]) {
  let length = -1
  for (let line of text) length += line.length + 1
  return length
}

/// A change set holds a sequence of changes or change descriptions.
export class ChangeSet<C extends ChangeDesc = Change> implements Mapping {
  private _changedRanges: null | readonly ChangedRange[] = null

  /// @internal
  constructor(
    /// The changes in this set.
    readonly changes: readonly C[],
    /// @internal
    readonly mirror: readonly number[] = empty) {}

  /// The number of changes in the set.
  get length(): number {
    return this.changes.length
  }

  /// Change sets can track which changes are inverses of each other,
  /// to allow robust position mapping in situations where changes are
  /// undone and then redone again. This queries which change is the
  /// mirror image of a given change (by index).
  getMirror(n: number): number | null {
    for (let i = 0; i < this.mirror.length; i++)
      if (this.mirror[i] == n) return this.mirror[i + (i % 2 ? -1 : 1)]
    return null
  }

  /// Append a change to this set, returning an extended set. `mirror`
  /// may be the index of a change already in the set, which
  /// [mirrors](#state.ChangeSet.getMirror) the new change.
  append(change: C, mirror?: number): ChangeSet<C> {
    return new ChangeSet(this.changes.concat(change), mirror != null ? this.mirror.concat(this.length, mirror) : this.mirror)
  }

  /// Add a change to the start of this set, returning an extended
  /// set.
  prepend(change: C, mirror?: number): ChangeSet<C> {
    let newMirror = this.mirror.length ? this.mirror.map(i => i + 1) : empty
    return new ChangeSet([change].concat(this.changes), mirror == null ? newMirror : newMirror.concat(0, mirror + 1))
  }

  /// Append another change set to this one.
  appendSet(changes: ChangeSet<C>): ChangeSet<C> {
    return changes.length == 0 ? this :
      this.length == 0 ? changes :
      new ChangeSet(this.changes.concat(changes.changes),
                    this.mirror.concat(changes.mirror.map(i => i + this.length)))
  }

  /// The empty change set.
  static empty: ChangeSet<Change> = new ChangeSet(empty)

  /// @internal
  mapPos(pos: number, assoc: number = -1, mode: MapMode = MapMode.Simple): number {
    return this.mapInner(pos, assoc, mode, 0, this.length)
  }

  /// @internal
  mapInner(pos: number, assoc: number, mode: MapMode, fromI: number, toI: number): number {
    let dir = toI < fromI ? -1 : 1
    let hasMirrors = this.mirror.length > 0, mirror

    for (let i = fromI - (dir < 0 ? 1 : 0), endI = toI - (dir < 0 ? 1 : 0); i != endI; i += dir) {
      let {from, to, length} = this.changes[i]
      if (dir < 0) {
        let len = to - from
        to = from + length
        length = len
      }

      if (pos < from) continue
      if (pos > to) {
        pos += length - (to - from)
        continue
      }
      // Change touches this position
      if (hasMirrors && (mirror = this.getMirror(i)) != null &&
          (dir > 0 ? mirror > i && mirror < toI : mirror < i && mirror >= toI) && // A mirror exists
          (assoc > 0 ? pos < to : pos > from)) {
        i = mirror
        pos = this.changes[i].from + (pos - from)
        continue
      }
      if (pos > from && pos < to) {
        if (mode != MapMode.Simple) return -1
        pos = assoc <= 0 ? from : from + length
      } else {
        if (from < pos && mode == MapMode.TrackBefore || to > pos && mode == MapMode.TrackAfter) return -1
        pos = (from == to ? assoc <= 0 : pos == from) ? from : from + length
      }
    }
    return pos
  }

  /// Check whether these changes touch a given range. When one of the
  /// changes entirely covers the range, the string `"cover"` is
  /// returned.
  touchesRange(from: number, to: number): boolean | "cover" {
    let result = false
    for (let change of this.changes) {
      if (change.to >= from && change.from <= to) {
        if (change.from < from && change.to > to) return "cover"
        result = true
      }
      let diff = change.length - (change.to - change.from)
      if (from > change.from) from += diff
      if (to > change.to) to += diff
    }
    return result
  }

  /// Get a partial [mapping](#state.Mapping) covering part of this
  /// change set.
  partialMapping(from: number, to: number = this.length): Mapping {
    if (from == 0 && to == this.length) return this
    return new PartialMapping(this, from, to)
  }

  /// Summarize this set of changes as a minimal sequence of changed
  /// ranges, sorted by position. For example, if you have changes
  /// deleting between 1 and 4 and inserting a character at 1, the
  /// result would be a single range saying 1 to 4 in the old doc was
  /// replaced with range 1 to 2 in the new doc.
  changedRanges(): readonly ChangedRange[] {
    if (this._changedRanges) return this._changedRanges
    let set: ChangedRange[] = []
    for (let i = 0; i < this.length; i++) {
      let change = this.changes[i]
      let fromA = change.from, toA = change.to, fromB = change.from, toB = change.from + change.length
      if (i < this.length - 1) {
        let mapping = this.partialMapping(i + 1)
        fromB = mapping.mapPos(fromB, 1); toB = mapping.mapPos(toB, 1)
      }
      if (i > 0) {
        let mapping = this.partialMapping(i, 0)
        fromA = mapping.mapPos(fromA, 1); toA = mapping.mapPos(toA, 1)
      }
      new ChangedRange(fromA, toA, fromB, toB).addToSet(set)
    }
    return this._changedRanges = set
  }

  /// Convert a set of changes to a set of change descriptions.
  get desc(): ChangeSet<ChangeDesc> {
    if (this.changes.length == 0 || this.changes[0] instanceof ChangeDesc) return this
    return new ChangeSet(this.changes.map(ch => (ch as any).desc), this.mirror)
  }

  /// Create a JSON-serializable representation of this change set.
  toJSON(): any {
    let changes = this.changes.map(change => change.toJSON())
    return this.mirror.length == 0 ? changes : {mirror: this.mirror, changes}
  }

  /// Read a change set from its JSON representation.
  static fromJSON<C extends ChangeDesc>(ChangeType: {fromJSON: (json: any) => C}, json: any): ChangeSet<C> {
    let mirror, changes
    if (Array.isArray(json)) {
      mirror = empty
      changes = json
    } else if (!json || !Array.isArray(json.mirror) || !Array.isArray(json.changes)) {
      throw new RangeError("Invalid JSON representation for ChangeSet")
    } else {
      ;({mirror, changes} = json)
    }
    return new ChangeSet(changes.map((ch: any) => ChangeType.fromJSON(ch)), mirror)
  }
}

class PartialMapping implements Mapping {
  constructor(readonly changes: ChangeSet<any>, readonly from: number, readonly to: number) {}
  mapPos(pos: number, assoc: number = -1, mode: MapMode = MapMode.Simple): number {
    return this.changes.mapInner(pos, assoc, mode, this.from, this.to)
  }
}

/// A changed range represents a replacement as two absolute ranges,
/// one pointing into the old document (the replaced content) and one
/// pointing into the new document (the content that replaces it).
export class ChangedRange {
  // FIXME store unchanged ranges instead?
  constructor(
    /// The start of the replaced range in the old document.
    readonly fromA: number,
    /// The end of the replaced range in the old document.
    readonly toA: number,
    /// The start of the replacing range in the new document.
    readonly fromB: number,
    /// The end of the replacing range in the new document.
    readonly toB: number) {}

  /// @internal
  join(other: ChangedRange): ChangedRange {
    return new ChangedRange(Math.min(this.fromA, other.fromA), Math.max(this.toA, other.toA),
                            Math.min(this.fromB, other.fromB), Math.max(this.toB, other.toB))
  }

  /// @internal
  // FIXME used by view. Document?
  addToSet(set: ChangedRange[]): ChangedRange[] {
    let i = set.length, me: ChangedRange = this
    for (; i > 0; i--) {
      let range = set[i - 1]
      if (range.fromA > me.toA) continue
      if (range.toA < me.fromA) break
      me = me.join(range)
      set.splice(i - 1, 1)
    }
    set.splice(i, 0, me)
    return set
  }

  /// The difference in document length created by this change
  /// (positive when the document grew).
  get lenDiff() { return (this.toB - this.fromB) - (this.toA - this.fromA) }
}
