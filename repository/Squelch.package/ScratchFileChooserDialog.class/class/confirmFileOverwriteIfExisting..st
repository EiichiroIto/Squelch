utilities
confirmFileOverwriteIfExisting: aFilename
	"If the given file exists, ask the user if they want to overwrite it or pick a different file name."

	| response fName |
	fName := aFilename.
	(fName endsWith: '.sb') ifFalse: [fName := fName, '.sb'].
	fName asFileReference isFile ifFalse: [^ aFilename].

	response := DialogBoxMorph
		askWithCancel: 'The file name already exists. Overwrite existing file?'.
	response = #cancelled ifTrue: [^ #cancelled].
	response ifTrue: [^ fName] ifFalse: [^ false].
