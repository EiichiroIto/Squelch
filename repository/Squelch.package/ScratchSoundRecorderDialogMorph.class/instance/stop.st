button commands
stop

	recorder isActive ifTrue: [
		recorder pause.
		recorder trim: 1300 normalizedVolume: 80.0].
	self
		setMode: #stop;
		setMode: #play isDisabled: false;
		setMode: #record isDisabled: false.
	recorder recordedSound
		ifNil: [duration := 0.0]
		ifNotNil: [duration := recorder recordedSound duration].
	self updateTime.
	self changed.
