stepping
checkForWeDo
	"Check for WeDo, and show motor blocks if it is found."
	"Note: Polling on Vista can take several hundred milliseconds, so reduce polling to just a few times per minute."

	| now |
	now := Time millisecondClockValue.
	(lastWeDoPoll isNil or: [lastWeDoPoll > now]) ifTrue: [lastWeDoPoll := 0].
	((now - lastWeDoPoll) < 15000) ifTrue: [^ self]. "don't poll too often"
	lastWeDoPoll := now.
	WeDoPlugin readInputs.
	WeDoPlugin isOpen ifTrue: [
		workPane showMotorBlocks ifTrue: [^ self].
		self showMotorBlocks.
		WeDoPlugin readInputs].
