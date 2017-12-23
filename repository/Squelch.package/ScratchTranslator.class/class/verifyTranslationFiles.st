import/export
verifyTranslationFiles
	"Returns a dictionary with each language filename as a key and a dictionary with the header and formatting fields as the key's value"
	"self verifyTranslationFiles"

	| verificationDict dict subDict |
	verificationDict := Dictionary new.
	self translationDir fileNames do: [: n |
		dict := self importTranslation: n.
		subDict := Dictionary new.
		subDict at: 'header' put: (dict at: '' ifAbsent: ['no header']).
		self formattingHeaderFields do: [:f |
			subDict at: f put: (dict at: f ifAbsent: [''])].

		verificationDict at: n put: subDict].
	^ verificationDict