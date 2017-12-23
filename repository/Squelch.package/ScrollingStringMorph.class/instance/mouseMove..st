event handling
mouseMove: evt

	| newLoc |
	self autoScroll: evt cursorPoint y.

	newLoc := self indexForPoint: evt cursorPoint.
	newLoc < startLoc
		ifTrue: [selectionStart := newLoc. selectionEnd := startLoc]
		ifFalse: [selectionStart := startLoc. selectionEnd := newLoc].

	self changed.
