operations
addWord: anObject

	| s |
	s := (anObject isKindOf: String) ifTrue: [anObject] ifFalse: [anObject printString].
	contentsMorph moveCursorContentsEnd.
	contentsMorph lines last isEmpty ifFalse: [s := ' ', s].
	contentsMorph insertString: s.
