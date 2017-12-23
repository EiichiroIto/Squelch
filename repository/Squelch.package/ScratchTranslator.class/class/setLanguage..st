language translation
setLanguage: aString
	"Set the current language. If the language is not supported, use English (i.e. an empty translation dictionary)."

	| dict |
	"default to English"
	Language := 'en'.
	TranslationDict := Dictionary new.
	HeaderString := ''.
	self setRenderingHints.  "clear rendering hints"
	ScratchTranslator detectRenderPlugin.

	aString = 'en' ifTrue: [^ self].

	dict := self importTranslation: aString, '.po'.
	dict ifNotNil: [
		Language := aString.
		TranslationDict := dict.
		HeaderString := dict at: '' ifAbsent: [''].
		dict removeKey: '' ifAbsent: [].
		self setRenderingHints.
		"RenderWithSqueak ifTrue: [self convertToMacRoman]."
		self isRTL ifTrue: [self fixAmbigousRTLPunctuation].
		self addSensorTranslations].
