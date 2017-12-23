forms/sounds/icons
meowSound
	MeowSound
		ifNil: [ MeowSound := SampledSound fromWaveFileNamed: (FileSystem workingDirectory / 'ScratchSkin' / 'kitten.wav') pathString ].
	^ MeowSound