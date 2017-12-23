button commands
play

	recorder pause.
	recorder playback.
	curStep := 1.
	self
		setMode: #play;
		setMode: #record isDisabled: true.
	self changed.