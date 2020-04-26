import {EditorView} from "./editorview"
import {ContentView} from "./contentview"
import {selectionCollapsed, getSelection} from "./dom"
import browser from "./browser"
import {EditorSelection, Change, Transaction} from "@codemirror/next/state"

const LineSep = "\ufdda" // A Unicode 'non-character', used to denote newlines internally

export function applyDOMChange(view: EditorView, start: number, end: number, typeOver: boolean): boolean {
  let change, newSel
  let sel = view.state.selection.primary, bounds
  if (start > -1 && (bounds = view.docView.domBoundsAround(start, end, 0))) {
    let {from, to} = bounds
    let selPoints = view.docView.impreciseHead || view.docView.impreciseAnchor ? [] : selectionPoints(view.contentDOM, view.root)
    let reader = new DOMReader(selPoints)
    reader.readRange(bounds.startDOM, bounds.endDOM)
    newSel = selectionFromPoints(selPoints, from)

    let preferredPos = sel.from, preferredSide = null
    // Prefer anchoring to end when Backspace is pressed
    if (view.inputState.lastKeyCode === 8 && view.inputState.lastKeyTime > Date.now() - 100) {
      preferredPos = sel.to
      preferredSide = "end"
    }
    let diff = findDiff(view.state.doc.slice(from, to, LineSep), reader.text,
                        preferredPos - from, preferredSide)
    if (diff) change = new Change(from + diff.from, from + diff.toA,
                                  reader.text.slice(diff.from, diff.toB).split(LineSep))
  } else if (view.hasFocus) {
    let domSel = getSelection(view.root)
    let {impreciseHead: iHead, impreciseAnchor: iAnchor} = view.docView
    let head = iHead && iHead.node == domSel.focusNode && iHead.offset == domSel.focusOffset ? view.state.selection.primary.head
      : view.docView.posFromDOM(domSel.focusNode!, domSel.focusOffset)
    let anchor = iAnchor && iAnchor.node == domSel.anchorNode && iAnchor.offset == domSel.anchorOffset
      ? view.state.selection.primary.anchor
      : selectionCollapsed(domSel) ? head : view.docView.posFromDOM(domSel.anchorNode!, domSel.anchorOffset)
    if (head != sel.head || anchor != sel.anchor)
      newSel = EditorSelection.single(anchor, head)
  }

  if (!change && !newSel) return false

  // Heuristic to notice typing over a selected character
  if (!change && typeOver && !sel.empty && newSel && newSel.primary.empty)
    change = new Change(sel.from, sel.to, view.state.doc.sliceLines(sel.from, sel.to))

  if (change) {
    let startState = view.state
    // Android browsers don't fire reasonable key events for enter,
    // backspace, or delete. So this detects changes that look like
    // they're caused by those keys, and reinterprets them as key
    // events.
    if (browser.android &&
        ((change.from == sel.from && change.to == sel.to &&
          change.length == 1 && change.text.length == 2 &&
          dispatchKey(view, "Enter", 10)) ||
         (change.from == sel.from - 1 && change.to == sel.to && change.length == 0 &&
          dispatchKey(view, "Backspace", 8)) ||
         (change.from == sel.from && change.to == sel.to + 1 && change.length == 0 &&
          dispatchKey(view, "Delete", 46))))
      return view.state != startState

    let tr = startState.t()
    if (change.from >= sel.from && change.to <= sel.to && change.to - change.from >= (sel.to - sel.from) / 3) {
      let before = sel.from < change.from ? startState.doc.slice(sel.from, change.from, LineSep) : ""
      let after = sel.to > change.to ? startState.doc.slice(change.to, sel.to, LineSep) : ""
      tr.replaceSelection((before + change.text.join(LineSep) + after).split(LineSep))
    } else {
      tr.change(change)
      if (newSel && !tr.selection.primary.eq(newSel.primary) && newSel.primary.to <= tr.doc.length)
        tr.setSelection(tr.selection.replaceRange(newSel.primary))
    }
    view.dispatch(tr.scrollIntoView().annotate(Transaction.userEvent, "input"))
    return true
  } else if (newSel && !newSel.primary.eq(sel)) {
    let tr = view.state.t().setSelection(newSel)
    if (view.inputState.lastSelectionTime > Date.now() - 50) {
      if (view.inputState.lastSelectionOrigin == "keyboard") tr.scrollIntoView()
      else tr.annotate(Transaction.userEvent, view.inputState.lastSelectionOrigin!)
    }
    view.dispatch(tr)
    return true
  }
  return false
}

function findDiff(a: string, b: string, preferredPos: number, preferredSide: string | null)
    : {from: number, toA: number, toB: number} | null {
  let minLen = Math.min(a.length, b.length)
  let from = 0
  while (from < minLen && a.charCodeAt(from) == b.charCodeAt(from)) from++
  if (from == minLen && a.length == b.length) return null
  let toA = a.length, toB = b.length
  while (toA > 0 && toB > 0 && a.charCodeAt(toA - 1) == b.charCodeAt(toB - 1)) { toA--; toB-- }

  if (preferredSide == "end") {
    let adjust = Math.max(0, from - Math.min(toA, toB))
    preferredPos -= toA + adjust - from
  }
  if (toA < from && a.length < b.length) {
    let move = preferredPos <= from && preferredPos >= toA ? from - preferredPos : 0
    from -= move
    toB = from + (toB - toA)
    toA = from
  } else if (toB < from) {
    let move = preferredPos <= from && preferredPos >= toB ? from - preferredPos : 0
    from -= move
    toA = from + (toA - toB)
    toB = from
  }
  return {from, toA, toB}
}

class DOMReader {
  text: string = ""
  constructor(private points: DOMPoint[]) {}

  readRange(start: Node | null, end: Node | null) {
    if (!start) return
    let parent = start.parentNode!
    for (let cur = start!;;) {
      this.findPointBefore(parent, cur)
      this.readNode(cur)
      let next: Node | null = cur.nextSibling
      if (next == end) break
      let view = ContentView.get(cur), nextView = ContentView.get(next!)
      if ((view ? view.breakAfter : isBlockElement(cur)) ||
          ((nextView ? nextView.breakAfter : isBlockElement(next!)) && !(cur.nodeName == "BR" && !(cur as any).cmIgnore)))
        this.text += LineSep
      cur = next!
    }
    this.findPointBefore(parent, end)
  }

  readNode(node: Node) {
    if ((node as any).cmIgnore) return
    let view = ContentView.get(node)
    let fromView = view && view.overrideDOMText
    let text: string | undefined
    if (fromView != null) text = fromView.join(LineSep)
    else if (node.nodeType == 3) text = node.nodeValue!
    else if (node.nodeName == "BR") text = node.nextSibling ? LineSep : ""
    else if (node.nodeType == 1) this.readRange(node.firstChild, null)
    if (text != null) {
      this.findPointIn(node, text.length)
      this.text += text
    }
  }

  findPointBefore(node: Node, next: Node | null) {
    for (let point of this.points)
      if (point.node == node && node.childNodes[point.offset] == next)
        point.pos = this.text.length
  }

  findPointIn(node: Node, maxLen: number) {
    for (let point of this.points)
      if (point.node == node)
        point.pos = this.text.length + Math.min(point.offset, maxLen)
  }
}

function isBlockElement(node: Node): boolean {
  return node.nodeType == 1 && /^(DIV|P|LI|UL|OL|BLOCKQUOTE|DD|DT|H\d|SECTION|PRE)$/.test(node.nodeName)
}

class DOMPoint {
  pos: number = -1
  constructor(readonly node: Node, readonly offset: number) {}
}

function selectionPoints(dom: HTMLElement, root: DocumentOrShadowRoot): DOMPoint[] {
  let result: DOMPoint[] = []
  if (root.activeElement != dom) return result
  let {anchorNode, anchorOffset, focusNode, focusOffset} = getSelection(root)
  if (anchorNode) {
    result.push(new DOMPoint(anchorNode, anchorOffset))
    if (focusNode != anchorNode || focusOffset != anchorOffset)
      result.push(new DOMPoint(focusNode!, focusOffset))
  }
  return result
}

function selectionFromPoints(points: DOMPoint[], base: number): EditorSelection | null {
  if (points.length == 0) return null
  let anchor = points[0].pos, head = points.length == 2 ? points[1].pos : anchor
  return anchor > -1 && head > -1 ? EditorSelection.single(anchor + base, head + base) : null
}

function dispatchKey(view: EditorView, name: string, code: number): boolean {
  let options = {key: name, code: name, keyCode: code, which: code, cancelable: true}
  let down = new KeyboardEvent("keydown", options)
  view.contentDOM.dispatchEvent(down)
  let up = new KeyboardEvent("keyup", options)
  view.contentDOM.dispatchEvent(up)
  return down.defaultPrevented || up.defaultPrevented
}
