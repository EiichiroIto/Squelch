event handling
mouseEnter: evt

	(type = #edge)
		ifTrue: [World activeHand showTemporaryCursor: Cursor resizeLeft]
		ifFalse: [World activeHand showTemporaryCursor: Cursor corner].
