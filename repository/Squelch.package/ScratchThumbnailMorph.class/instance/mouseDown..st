event handling
mouseDown: evt

	draggingDirection := false.
	evt shiftPressed ifTrue: [
		target ifNotNil: [target makeVisible].
		^ self].

	evt hand waitForClicksOrDrag: self event: evt.
