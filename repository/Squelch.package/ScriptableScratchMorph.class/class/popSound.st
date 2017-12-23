forms/sounds/icons
popSound
	PopSound
		ifNil: [ PopSound := SampledSound fromWaveFileNamed: (FileSystem workingDirectory / 'ScratchSkin' / 'Pop.wav') pathString ].
	^ PopSound