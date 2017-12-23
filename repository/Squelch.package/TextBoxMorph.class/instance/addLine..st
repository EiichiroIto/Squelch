operations
addLine: anObject

	| s |
	s := (anObject isKindOf: String) ifTrue: [anObject] ifFalse: [anObject printString].
	contentsMorph moveCursorContentsEnd.
	s size = 0 ifTrue: [s := String cr].
	contentsMorph lines last isEmpty ifFalse: [s := String cr, s].
	contentsMorph insertString: s.
