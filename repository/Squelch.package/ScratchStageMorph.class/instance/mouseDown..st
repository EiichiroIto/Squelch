event handling
mouseDown: evt
	"Handle a mouse down event."

	evt hand newKeyboardFocus: nil.
	evt hand toolType ifNotNil: [evt hand toolType: nil].

	evt yellowButtonPressed
		ifTrue: [Sensor waitNoButton. ^ self rightButtonMenu]
		ifFalse:	[evt hand waitForClicksOrDrag: self event: evt].
