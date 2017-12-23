private-special forms
doWaitUntil
	"Evaluates the the wait condition until it evaluates to true."

	| block args |
	block := stackFrame expression.
	args := stackFrame arguments.

	"evaluate the termination expression if we haven't yet."
	args size < 1 ifTrue: [^ self evaluateNextArgument].

	"if the termination condition is met, pop this frame and we're done."
	args first ifTrue: [^ self popStackFrame].

	"Set up for waitUntil loop. We need to:
		1.  yield to another process
		2.  evaluate the termination expression again
	Push these onto stack in reverse order."

	"2.  evaluate this block again"
	"(Remove the current frame and replace it with one that will force the termination expression to be re-evaluated.)"
	self popStackFrameNoUnhightlight.
	self pushStackFrame: (ScratchStackFrame new expression: block).

	"1.  yield to another process"
	self pushStackFrame: (ScratchStackFrame new shouldYield: true).
