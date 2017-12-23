drawing
exportFileName: fileName

	| form fName |
	form := self stageShotForm.
	form depth <= 8 ifTrue: [
		(fileName asLowercase endsWith: '.gif')
			ifTrue: [fName := fileName]
			ifFalse: [fName := fileName, '.gif'].
		GIFReadWriter putForm: form colorReduced8Bit onFileNamed: fName.
		^ self].

	(fileName asLowercase endsWith: '.bmp')
		ifTrue: [fName := fileName]
		ifFalse: [fName := fileName, '.bmp'].
	(form asFormOfDepth: 32) writeBMPFileNamed: fName.
