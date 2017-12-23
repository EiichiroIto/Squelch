private
getScratchInfoFromFile
	"Answer the project info dictionary for the currently selected file. Answer the empty dictionary if no file is selected or if the file does not include a project info dictionary (e.g. if it is in an older Scratch file format)."

	| result fullName f version buf |
	result := Dictionary new.

	self selectedFile ifNil: [^ result].

	fullName := currentDir / self selectedFile.
	fullName isFile ifFalse: [^ result].
	[f := (FileStream readOnlyFileNamed: fullName pathString) binary] ifError: [^ result].

	"["
		version := ObjStream scratchFileVersionFrom: (f next: 10) asString.
		(version = 1) | (version = 2) ifTrue: [
			buf := f next: f uint32.
			result := ObjStream new readObjFrom: (ReadStream on: buf)].
	"] ifError: []."
	f close.

	^ result
