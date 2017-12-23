private-special forms
doForeverIf
	"Executes one iteration of a forever loop."

	| block args |
	block := stackFrame expression.
	args := stackFrame arguments.

	"evaluate the condition if we haven't yet"
	args size < 1 ifTrue: [^ self evaluateNextArgument].

	"remove the current frame and replace it with one that will force the test expression to be re-evaluated."
	self popStackFrameNoUnhightlight.
	self pushStackFrame: (ScratchStackFrame new expression: block).
	self pushStackFrame: (ScratchStackFrame new shouldYield: true). "yield after possibly running body"

	"if the condition was true, run the body"
	args first ifTrue: [
		self pushStackFrame: (ScratchStackFrame new expression: block firstBlockList)].

