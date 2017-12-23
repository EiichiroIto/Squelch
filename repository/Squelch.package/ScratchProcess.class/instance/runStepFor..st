entry points
runStepFor: aStageMorph
	"Evaluates the current expression, then the next, etc., until the next yield."

	| expr |
	"evaluate blocks until we're ready to yield"
	readyToYield := false.
	[readyToYield or: [stackFrame isNil]] whileFalse: [
		self evaluateFor: aStageMorph].

	readyToTerminate ifTrue: [
		"pop all stack frames, unlighting enclosing blocks:"
		[stackFrame isNil] whileFalse: [
			expr := stackFrame expression.
			(expr isKindOf: BlockMorph) ifTrue: [expr litUp: false].
			self popStackFrame]].
