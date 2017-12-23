language translation
translationFor: englishString
	"Return the translation of the given (English) string for the current language. If there is no entry for the given string, return the original string."

	| s |
	s := TranslationDict at: englishString ifAbsent: [englishString].
	s size = 0 ifTrue: [s := englishString].
	"RenderWithSqueak
		ifTrue: [s isUnicode ifTrue: [s := s asMacRoman]]
		ifFalse: [s := s asUTF8]."
	^ s

