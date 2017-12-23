accessing
infoString

	^ frameForm
		ifNil: ['not open']
		ifNotNil: [frameForm width printString, 'x', frameForm height printString]
