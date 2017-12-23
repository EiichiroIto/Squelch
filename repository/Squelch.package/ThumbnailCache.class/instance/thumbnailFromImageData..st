other
thumbnailFromImageData: aByteArray
	"Answer a thumbnail for the image stored in the given ByteArray (the contents of a binary file)."

	| f scale |
	f := Form fromBinaryStream: (ReadStream on: aByteArray).
	f depth < 16 ifTrue: [f := f asFormOfDepth: 16].
	scale := (80.0 / f width) min: (60.0 / f height).
	f := f magnifyBy: scale.
	^ f
