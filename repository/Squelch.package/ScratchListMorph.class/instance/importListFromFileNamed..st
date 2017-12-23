import/export
importListFromFileNamed: aFilename

	| f |
	f := FileStream readOnlyFileNamedOrNil: (FileSystem workingDirectory / aFilename) pathString.
	f ifNil: [
		DialogBoxMorph inform: 'File not found' withDetails: aFilename.
		^ nil].

	"Assume the file was encoded as UTF8"
	[	self newContents:
			(f contentsOfEntireFile lines).
	] ifError: [self beep].
