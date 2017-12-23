event handling
textMouseDown: evt
	"Handle a mouse down event in text mode at the given point in canvas coordinates."

	| p |
	evt hand newKeyboardFocus: self.
	p := self screenToCanvas: evt cursorPoint.

	(self textHandleContainsPoint: p) ifTrue: [  "click in drag handle"
		dragOffset := textBox position - p.
		textDragMode := #move.
		^ self].

	((textBox bounds insetBy: 2) containsPoint: p) ifTrue: [  "click in textBox"
		textDragMode := #select.
		"textBox ensureOSFont."
		textBox mouseDown: (evt copy setPosition: p).
		evt hand newKeyboardFocus: self.  "take focus back from textBox"
		^ self].

	"click not in textBox or drag handle; do nothing"
	textDragMode := #none.

