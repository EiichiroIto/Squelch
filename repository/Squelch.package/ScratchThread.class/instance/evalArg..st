private
evalArg: anObject
	"Evaluate the given argument. If it is a list (array), then it is an expression that must be evaluated. Otherwise it is a constant value that can be returned."

	(anObject isKindOf: Array) ifTrue: [^ self evalCommand: anObject].
	^ anObject
