locale
guessLanguage
	"Try to guess a language setting based on the local."
	"ScratchTranslator guessLanguage"

	| lang country myLocale |
	(lang := self primLanguage) ifNil: [^ 'en'].
	lang size > 2 ifTrue: [lang := lang copyFrom: 1 to: 2].
	country := self primCountry ifNil: [^ lang].
	country size > 2 ifTrue: [country := country copyFrom: 1 to: 2].

	"first try lang + country:"
	myLocale := lang asLowercase, '_', country asLowercase.
	ISODict keys do: [:code | code asLowercase = myLocale ifTrue: [^ code]].

	"then try just lang:"
	myLocale := lang asLowercase.
	ISODict keys do: [:code | code asLowercase = myLocale ifTrue: [^ code]].

	^ 'en'  "if no match, use English"

