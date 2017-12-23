event handling
handlesMouseDown: evt

	| p |
	p := evt cursorPoint.
	^ (brushSizeMorph containsPoint: p) |
		(textSizeMenu 
			ifNil: [false]
			ifNotNil: [(textSizeMenu containsPoint: p) | 
						(textFontMenu containsPoint: p)])
