event handling
mouseDown: evt

	| p |
	p := evt cursorPoint.
	((showHideMorph bounds expandBy: 4) containsPoint: p) ifTrue: [^ self toggleShowing].
	(isShowing and: [commentMorph containsPoint: p])
		ifTrue: [^ commentMorph mouseDown: evt].

	super mouseDown: evt.
