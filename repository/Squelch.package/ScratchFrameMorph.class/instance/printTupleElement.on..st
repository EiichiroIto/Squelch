uploading
printTupleElement: el on: s

	(el isKindOf: Array) ifTrue: [self printTupleList: el on: s. ^ self].
	(el isKindOf: Symbol) ifTrue: [s nextPutAll: el. ^ self].
	(el isKindOf: String) ifTrue: [s nextPut: $". s nextPutAll: el. s nextPut: $". ^ self].
	(el isKindOf: ScriptableScratchMorph) ifTrue: [s nextPutAll: el objName. ^ self].
	s nextPutAll: el printString.
