event handling
mouseMove: evt

	| p |
	p := stage adjustedCursorPoint.
	p = mouseDownPoint ifFalse: [mouseMoved := true].
	mouseFocus ifNotNil: [
		dragOffset
			ifNil: [mouseMoved ifTrue: [mouseFocus mouseMove: (evt copy setPosition: p)]]
			ifNotNil: [mouseFocus position: p + dragOffset]].

