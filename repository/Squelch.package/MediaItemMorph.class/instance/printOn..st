printing
printOn: aStream

	aStream nextPutAll: self class name, '[', media mediaName, ']'.
