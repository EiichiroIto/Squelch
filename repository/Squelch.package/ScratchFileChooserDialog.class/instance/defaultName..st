accessing
defaultName: aString
	"Set the default file name."

	newFileName ifNotNil: [newFileName contents: aString].
