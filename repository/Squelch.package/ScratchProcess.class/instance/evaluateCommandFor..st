private-evaluation
evaluateCommandFor: aStageMorph
	"Evaluates the current block. If the argument is non-nil, redraw the stage."

	| expression |
	expression := stackFrame expression.
	BlockHighlightMSecs > 1 ifTrue: [expression litUp: true].

	expression isSpecialForm ifTrue: [^ self evaluateSpecialForm].

	"evaluate arguments, if necessary"
	stackFrame arguments size < expression argumentCount
		ifTrue: [^ self evaluateNextArgument].

	expression isTimed ifTrue: [^ self applyTimedCommand].

	self applyPrimitive.

	aStageMorph ifNotNil: [
		aStageMorph updateTrailsForm.
		BlockHighlightMSecs = 1 ifTrue: [  "normal (non-turbo) mode; redraw after each cmd"
			World displayWorldSafely]].
