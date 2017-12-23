entry points
stepUntilDoneFor: aStageMorph

	[self isRunning] whileTrue: [
		Sensor keyboardPressed.
		self runStepFor: aStageMorph].
