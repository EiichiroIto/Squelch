private-evaluation
evaluateFor: aStageMorph
	"Evaluates the current expression in the current environment for the given StageMorph."

	| expression |
	stackFrame shouldYield ifTrue: [^ self yield].
	expression := stackFrame expression.

	stackFrame shouldUnlight ifTrue: [
		expression litUp: false.
		^ self popStackFrame].

	expression isCollection ifTrue: [^ self evaluateSequence].
	expression isArgMorph ifTrue: [^ self evaluateSelfEvaluating].
	expression isBlockMorph ifTrue: [^ self evaluateCommandFor: aStageMorph].

	self error: 'Unknown expression type:  ', expression printString.
