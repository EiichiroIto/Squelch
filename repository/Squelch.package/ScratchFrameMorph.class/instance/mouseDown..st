event handling
mouseDown: evt
	"Revert to normal cursor."

	evt hand toolType: nil.

	(evt cursorPoint y - self top) < topPane height ifTrue: [
		fillScreenFlag ifFalse: [evt hand grabMorph: self]].
