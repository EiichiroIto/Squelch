button commands
record

	recorder isActive ifFalse:[
		recorder clearRecordedSound.
		recorder resumeRecording.
		savedMeterLevels := OrderedCollection new.
		duration := 0.
		self
			setMode: #record;
			setMode: #play isDisabled: false.
		self changed].
