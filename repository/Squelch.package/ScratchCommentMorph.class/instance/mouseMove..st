event handling
mouseMove: evt

	| p |
	evt hand newKeyboardFocus: nil.
	p := evt cursorPoint.

	isResizing ifTrue: [
		self width: (self defaultWidth max: ((p - self topLeft) + resizeOffset) x).
		commentMorph width: self width - (resizeMorph width)].
