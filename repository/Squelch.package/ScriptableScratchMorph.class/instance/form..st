accessing
form: aForm

	costume := (ImageMedia new form: aForm).
	costume mediaName: (self unusedMediaNameFromBaseName: 'costume').
	media addLast: costume.
	self costumeChanged.
	self updateMediaCategory.
