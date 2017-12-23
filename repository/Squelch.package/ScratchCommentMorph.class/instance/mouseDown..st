event handling
mouseDown: evt
	"Handle a mouse click. Left button either drags or performs click action. Right button brings up a menu."

	| p |
	World activeHand showTemporaryCursor: nil.
	evt hand newKeyboardFocus: nil.
	isResizing := false.
	p := evt cursorPoint.

	((showHideMorph bounds expandBy: 4) containsPoint: p) ifTrue: [^ self toggleShowing].
	(isShowing and: [commentMorph containsPoint: p])
		ifTrue: [^ commentMorph mouseDown: evt].

	evt yellowButtonPressed
		ifTrue: [Sensor waitNoButton. ^ self rightButtonMenu]
		ifFalse:	[((commentMorph topRight corner: commentMorph bottomRight + (10@0)) containsPoint: p)
			ifFalse: [evt hand grabMorph: self]
			ifTrue: [isResizing := true.
				resizeOffset := self bottomRight - p]].
