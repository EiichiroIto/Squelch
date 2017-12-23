import/export
importTranslation: aFilename
	"Import a translation dictionary."
	"self importTranslation: 'cs.po'"

	| f lines lstream result |
	f := FileStream readOnlyFileNamed: (self translationDir / aFilename) pathString.
	f ifNil: [
		DialogBoxMorph inform: 'File not found' withDetails: aFilename.
		^ nil].
	lines := f contentsOfEntireFile lines.

	"trim blanks"
	lines := lines collect: [:s | s trimLeft].

	lstream := ReadStream on: lines.
	[result := self parseTranslationLines: lstream] ifError: [
		DialogBoxMorph inform: 'Error reading file: ', aFilename,' at line ', (lstream position asString), '.'].

	^ result
