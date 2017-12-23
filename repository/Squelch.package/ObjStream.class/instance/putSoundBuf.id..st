fixed format-writing
putSoundBuf: anObject id: classID

	firstPass ifTrue: [^ self].
	stream nextPut: classID.
	stream uint32: anObject size.
	anObject storeBigEndianOn: stream stereo: false.

