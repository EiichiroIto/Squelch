accessing
xpos: aNumber

	| newX |
	newX := aNumber isInteger ifTrue: [aNumber] ifFalse: [aNumber asFloat].
	self referencePosition: (newX @ self ypos).
