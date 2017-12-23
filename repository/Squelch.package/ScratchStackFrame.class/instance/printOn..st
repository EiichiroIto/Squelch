accessing
printOn: aStream

	aStream nextPutAll: '[', expression printString, ' ', shouldUnlight printString, ']'.