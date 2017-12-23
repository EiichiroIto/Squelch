event handling
mouseDown: evt

	| edgeW bottomW |
	resizeMode := nil.

	evt cursorPoint y < (self top + 50) ifTrue: [
		evt hand grabMorph: self.
		^ self].

	edgeW := 30.
	bottomW := 30.
	((evt cursorPoint x - self left) < edgeW) ifTrue: [
		(self bottom - evt cursorPoint y) < bottomW
			ifTrue: [resizeMode := #bottomLeft]
			ifFalse: [resizeMode := #left].
		^ self].

	((self right - evt cursorPoint x) < edgeW) ifTrue: [
		(self bottom - evt cursorPoint y) < bottomW
			ifTrue: [resizeMode := #bottomRight]
			ifFalse: [resizeMode := #right].
		^ self].

	(self bottom - evt cursorPoint y) < edgeW ifTrue: [resizeMode := #bottom].
