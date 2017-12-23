accessing
setDirectory: anObject
	"Set the currently selected directory. The argument may be either a FileDirectory or a string."

	(anObject isKindOf: FileReference)
		ifTrue: [list currentDirectory: anObject]
		ifFalse:	[list currentDirectory: anObject asFileReference].
