printing
printOn: aStream

	aStream nextPutAll: mediaName, ' [', self mediaType, ']'.
