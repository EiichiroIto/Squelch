accessing
receiver: anObject
	"Set my receiver object and, if possible, my block color."

	receiver := anObject.
	(receiver respondsTo: #variableBlockColor)
		ifTrue: [self color: receiver variableBlockColor].
