event handling
enterKeyPressed: evt
	"Respond to the enter key being pressed in one of my input fields or on one of my buttons."

	"if a button has focus, do that button"
	(evt hand keyboardFocus isKindOf: ResizableToggleButton2) ifTrue: [
		evt hand keyboardFocus doButtonAction.
		^ self].

	"if any other submorph has focus, return OK"
	self yes.
