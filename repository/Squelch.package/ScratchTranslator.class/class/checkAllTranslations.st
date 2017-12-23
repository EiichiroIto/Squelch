language translation
checkAllTranslations
	"Check all the translation dictionaries."
	"self checkAllTranslations"

	| untranslated |
	self languageNames do: [:lang |
		self setLanguage: lang.
		untranslated := self checkTranslationDict.
		untranslated size > 0 ifTrue: [self halt: lang, ' missing ', untranslated size printString]].
