accessing
brushSize

	^ mode = #erase ifTrue: [eraserSize] ifFalse: [brushSize]
