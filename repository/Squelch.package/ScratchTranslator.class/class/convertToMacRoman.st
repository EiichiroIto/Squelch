Unicode rendering
convertToMacRoman
	"Convert my translations from UTF8 to MacRoman."

	| s |
	TranslationDict associationsDo: [:assoc |
		(assoc key asLowercase ~= 'language-name') ifTrue: [
			s := assoc value.
			s isUnicode ifTrue: [
				assoc value: s asMacRoman]]].
