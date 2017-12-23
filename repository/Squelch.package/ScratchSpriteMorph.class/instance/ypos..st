accessing
ypos: aNumber

	| newY |
	newY := aNumber isInteger ifTrue: [aNumber] ifFalse: [aNumber asFloat].
	self referencePosition: (self xpos @ newY).
