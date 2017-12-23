private-special forms
doReturn
	"Evaluates its argument, and returns the value to the frame from which the current method was called."

	| value args |

	args := stackFrame arguments.

	"Evaluate the argument, if necessary."
	args size < stackFrame expression argumentCount
		ifTrue: [^self evaluateNextArgument].

	"Remember the return value."
	args size > 0
		ifTrue:	[value := args first]
		ifFalse:	[value := nil].

	"Pop until we're out of frames to pop, or we hit a return marker."

	[stackFrame isNil] whileFalse:
		[self popStackFrame].

	stackFrame ifNotNil:	[
		self returnValueToParentFrame: value.
		self popStackFrame].
