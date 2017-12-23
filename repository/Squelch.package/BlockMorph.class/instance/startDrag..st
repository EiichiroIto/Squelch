event handling
startDrag: evt

	| rootForGrab point |
Transcript cr; show: 'self='; show: self.
	evt hand toolType ifNil: [
		point := evt hand firstClickCursorPoint ifNil: [ evt cursorPoint ].
		rootForGrab := self rootForGrabOf: self.
		rootForGrab ifNil: [^ self].
Transcript cr; show: 'root='; show: rootForGrab.
		evt hand grabMorph: rootForGrab.
		rootForGrab position: evt hand position + (rootForGrab topLeft - point)].

	self handleTool: evt hand toolType hand: evt hand