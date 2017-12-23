event handling
mouseDown: evt

	evt yellowButtonPressed | evt shiftPressed
		ifTrue: [Sensor waitNoButton. ^ self rightButtonMenu].

	evt hand toolType = 'CutTool' ifTrue: [
		evt shiftPressed ifFalse: [evt hand toolType: nil].
		ScratchFrameMorph putInClipboard: self.
		^ self delete].

	evt hand waitForClicksOrDrag: self event: evt.
