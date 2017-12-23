event handling
textMouseMove: evt
	"Draw and/or give feedback."

	| p |
	p := self screenToCanvas: evt cursorPoint.
	#move = textDragMode ifTrue: [
		textBox position: ((p + dragOffset) max: 0@0).
		textBox extent: canvasForm extent - textBox position].
	#select = textDragMode ifTrue: [
		textBox mouseMove: (evt copy setPosition: p)].
	self changed.
