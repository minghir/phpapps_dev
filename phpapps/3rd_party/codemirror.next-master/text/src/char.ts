let extendingChars = /[\u0300-\u036f\u0483-\u0489\u0591-\u05bd\u05bf\u05c1\u05c2\u05c4\u05c5\u05c7\u0610-\u061a\u064b-\u065e\u0670\u06d6-\u06dc\u06de-\u06e4\u06e7\u06e8\u06ea-\u06ed\u0711\u0730-\u074a\u0b82\u0bbe\u0bc0\u0bcd\u0bd7\u0d3e\u0d41-\u0d44\u0d4d\u0d57\u0d62\u0d63\u0e31\u0e34-\u0e3a\u0e47-\u0e4e\u0eb1\u0eb4-\u0eb9\u0ebb\u0ebc\u0ec8-\u0ecd\u180b-\u180d\u18a9\u200c\u200d]/
try { extendingChars = new RegExp("\\p{Grapheme_Extend}", "u") } catch (_) {}

/// Test whether a given code unit (as in, the thing that `charCodeAt`
/// returns) extends the character before it.
export function isExtendingChar(code: number): boolean {
  return code >= 768 && (code >= 0xdc00 && code < 0xe000 || extendingChars.test(String.fromCharCode(code)))
}

const nonASCIISingleCaseWordChar = /[\u00df\u0587\u0590-\u05f4\u0600-\u06ff\u3040-\u309f\u30a0-\u30ff\u3400-\u4db5\u4e00-\u9fcc\uac00-\ud7af]/

let wordChar: RegExp | null
try { wordChar = new RegExp("[\\p{Alphabetic}_]", "u") } catch (_) {}

// FIXME this doesn't work for astral chars yet (need different calling convention)

function isWordCharBasic(ch: string): boolean {
  if (wordChar) return wordChar.test(ch)
  return /\w/.test(ch) || ch > "\x80" &&
    (ch.toUpperCase() != ch.toLowerCase() || nonASCIISingleCaseWordChar.test(ch))
}

/// Test whether the given character is a word character.
export function isWordChar(ch: string, wordChars?: RegExp): boolean {
  if (!wordChars) return isWordCharBasic(ch)
  if (wordChars.source.indexOf("\\w") > -1 && isWordCharBasic(ch)) return true
  return wordChars.test(ch)
}

/// This is used to group characters into three categories—word
/// characters, whitespace, and anything else. It is used, by default,
/// to do things like selecting by word.
export enum CharType { Word, Space, Other }

/// Determine the character type for a given character.
export function charType(ch: string, wordChars?: RegExp): CharType {
  // FIXME make this configurable in a better way
  return /\s/.test(ch) ? CharType.Space : isWordChar(ch, wordChars) ? CharType.Word : CharType.Other
}

/// Find the code point at the given position in a string (as in the
/// [`codePointAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/codePointAt)
/// string method).
export function codePointAt(str: string, pos: number) {
  let code0 = str.charCodeAt(pos)
  if (code0 < 0xd800 || code0 > 0xdbff || pos + 1 == str.length) return code0
  let code1 = str.charCodeAt(pos + 1)
  if (code1 < 0xdc00 || code1 > 0xdfff) return code0
  return ((code0 - 0xd800) << 10) + (code1 - 0xdc00) + 0x10000
}

/// Given a Unicode codepoint, return the JavaScript string that
/// respresents it (as in
/// [`String.fromCodePoint`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint).
export function fromCodePoint(code: number) {
  if (code <= 0xffff) return String.fromCharCode(code)
  code -= 0x10000
  return String.fromCharCode((code >> 10) + 0xd800, (code & 1023) + 0xdc00)
}

/// The first character that takes up two positions in a JavaScript
/// string. It is often useful to compare with this after calling
/// `codePointAt`, to figure out whether your character takes up 1 or
/// 2 index positions.
export const minPairCodePoint = 0x10000
