Unicode rendering
fixAmbigousRTLPunctuation
	"In a right-to-left language such as Arabic, punctuation characters such as period can be treated as either right-to-left or left-to-right characters. When they appear at the beginning of a string, the directionality is ambiguous. We assume that translation strings that start with punctuation characters are intended to start in left-to-right mode. This method prefixes punctuation characters with the Unicode LTR mark character, U+200E."
	"Note: Embedded colons are prefixed with the LTR mark everwhere that they appear since block translation strings are broken into component parts that can start with a colon."

self shouldBeImplemented 
"
	| punctuation colon prefix utf32 s |
	punctuation := '.!%#' asByteArray.
	colon := $: asciiValue.
	prefix := UTF32 with: 16r200E.
	TranslationDict keys do: [:k |
		((TranslationDict at: k) isKindOf: UTF8) ifTrue: [
		utf32 := (UTF8 withAll: (TranslationDict at: k)) asUTF32.
		(utf32 size > 0 and: [punctuation includes: utf32 first]) ifTrue: [
			TranslationDict at: k put: (prefix, utf32) asUTF8].
		(utf32 includes: colon) ifTrue: [
			s := WriteStream on: (UTF32 new: 100).
			utf32 do: [:ch |
				ch = colon ifTrue: [s nextPut: 16r200E].
				s nextPut: ch].
			TranslationDict at: k put: s contents asUTF8]]]."

