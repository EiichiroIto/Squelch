fixed format-writing
putBytes: anObject id: classID

	firstPass ifTrue: [^ self].
	stream nextPut: classID.
	stream uint32: anObject size.
	stream nextPutAll: anObject asByteArray.
