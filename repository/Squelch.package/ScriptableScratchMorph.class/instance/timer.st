sensing ops
timer

	| now |
	now := Time millisecondClockValue.
	TimerStartMSecs ifNil: [TimerStartMSecs := now].
	TimerStartMSecs > now ifTrue: [TimerStartMSecs := now].
	^ (now - TimerStartMSecs) asFloat / 1000.0
