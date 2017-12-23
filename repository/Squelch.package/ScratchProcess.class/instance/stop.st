entry points
stop
	"Permanently terminates this process."

	stackFrame ifNotNil: [stackFrame stopMIDI; stopMotors; stopTalkThinkAsk].
	readyToYield := true.
	readyToTerminate := true.
	topBlock ifNotNil: [topBlock scratchProc: nil].
