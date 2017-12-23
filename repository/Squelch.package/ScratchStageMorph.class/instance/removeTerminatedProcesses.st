scratch processes/events
removeTerminatedProcesses
	"Remove terminated processes from the process list."

	| newRunning proc |
	newRunning := runningBlocks species new: 100.
	runningBlocks do: [:b |
		(proc := b scratchProc) ifNotNil: [
			proc isRunning
				ifTrue: [newRunning addLast: b]
				ifFalse: [proc errorFlag ifFalse: [b stop]]]].

	runningBlocks := newRunning.
