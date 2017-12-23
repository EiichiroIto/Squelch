event handling
handlesMouseDown: evt

	| p |
	p := evt cursorPoint.
	^ (Rectangle origin: backButton topLeft corner: fwdButton bottomRight) containsPoint: p.