startup
readDefaultNotes
	"If there is a file named 'defaultNotes.txt' in the Scratch folder, read it in."

	| dir |
	DefaultNotes := ''.
	dir := FileSystem workingDirectory.
	(dir / 'defaultNotes.txt') exists ifTrue: [
		DefaultNotes := (FileStream oldFileNamed: 'defaultNotes.txt') contentsOfEntireFile].
