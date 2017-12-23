event handling
mouseDown: evt

	#resize = type
		ifTrue: [
			offset := evt hand cursorPoint x - self left.
			^self ].
	
	offset := self targetBounds center dist: self center.