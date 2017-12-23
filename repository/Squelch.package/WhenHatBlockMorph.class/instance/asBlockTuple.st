other
asBlockTuple
	"Answer a tuple (Array) describing this block and its arguments."

	| argTuple |
	argTuple := (argMorph isKindOf: ArgMorph)
		ifTrue: [argMorph evaluate]
		ifFalse: [argMorph asBlockTuple].

	^ Array with: self class name with: argTuple
