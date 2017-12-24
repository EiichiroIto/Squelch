forms/sounds/icons
meowSound
	MeowSound
		ifNil: [ MeowSound := SampledSound fromWaveFileNamed: (FileSystem workingDirectory / 'ScratchSkin' / 'Kitten.wav') pathString ].
	^ MeowSound