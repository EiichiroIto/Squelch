event handling
mouseUp: evt

	| p |
	self mouseMove: evt.
	clickWasHandled ifTrue: [^ self].

	p := stage adjustedCursorPoint.
	mouseFocus ifNotNil: [
		mouseMoved ifFalse: [mouseFocus click: (MorphicEvent new setPosition: p)]].

	mouseFocus := nil.
	dragOffset := nil.

