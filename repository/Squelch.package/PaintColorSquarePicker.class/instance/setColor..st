event handling
setColor: aColor

	target ifNil: [^ self].

	Sensor shiftPressed | Sensor yellowButtonPressed
		ifTrue: [selector2 ifNotNil: [target perform: selector2 with: aColor]]
		ifFalse: [selector ifNotNil: [target perform: selector with: aColor]].
