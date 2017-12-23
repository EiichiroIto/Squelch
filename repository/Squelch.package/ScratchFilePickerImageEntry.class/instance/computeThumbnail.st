accessing
computeThumbnail
	"Compute my thumbnail, but don't do a 'self changed' because I may be run from a background thread."

	| fName fContents f scale |
	entryIsDirectory ifTrue: [^ self].
	thumbnailForm ifNotNil: [^ self].

	[	fName := directory fullNameFor: entryName.
		fContents := (FileStream readOnlyFileNamed: fName) binary contentsOfEntireFile.
		f := Form fromBinaryStream: (ReadStream on: fContents)
	] ifError: [^ self].

	f depth < 16 ifTrue: [f := f asFormOfDepth: 16].
	scale := (80.0 / f width) min: (60.0 / f height).
	thumbnailForm := f magnifyBy: scale.

	thumbnailReady := true.
