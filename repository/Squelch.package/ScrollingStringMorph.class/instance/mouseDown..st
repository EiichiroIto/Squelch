event handling
mouseDown: evt

	evt hand newKeyboardFocus: self.
	startLoc := self indexForPoint: evt cursorPoint.
	evt shiftPressed
		ifTrue: [
			startLoc < selectionStart ifTrue: [startLoc := selectionEnd].
			startLoc > selectionEnd ifTrue: [startLoc := selectionStart]]
		ifFalse: [selectionStart := selectionEnd := startLoc].
	evt hand waitForClicksOrDrag: self event: evt.
	self changed.
