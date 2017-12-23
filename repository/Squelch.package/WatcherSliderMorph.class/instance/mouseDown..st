event handling
mouseDown: evt

	(slider containsPoint: evt cursorPoint) ifTrue: [
		dragOffset := slider position - evt cursorPoint.
		^ self].

	dragOffset := nil.
	evt hand waitForClicksOrDrag: self event: evt.
