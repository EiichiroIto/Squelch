scratch processes/events
stepProcesses
	"Run each Scratch process until it gives up control, then filter out any processes that have terminated."
	"Details: Iterate over a copy of processes to allow processes to stop themselves. During development, the error catcher makes it difficult to track down errors, so it can be disabled."

	| proc |
	sensorBoard processIncomingData.

	ScratchProcess blockHighlightMSecs = 0 ifTrue: [^ self stepProcessesTurbo].

	inProcessStep ifTrue: [^ self].
	inProcessStep := true.
	ScratchFrameMorph useErrorCatcher
		ifTrue: [
			[self processesToRun do: [:p | (proc := p) runStepFor: self]]
				ifError: [proc errorFlag: true]]
		ifFalse: [
			self processesToRun do: [:p | p runStepFor: self]].

	self removeTerminatedProcesses.
"	self deleteTerminatedClones."

	inProcessStep := false.
