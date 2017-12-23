event handling
mouseDown: evt

	evt yellowButtonPressed ifTrue: [Sensor waitNoButton. ^ self rightButtonMenu].

	evt hand waitForClicksOrDrag: self event: evt.
