menu
readFromFile: fName
	"Read my samples from the file with the given name."

	(FileDirectory default fileExists: fName)
		ifFalse: [^ self inform: 'File not found' withDetails: fName].
	snd := SampledSound fromFileNamed: fName.

	completeSnd := snd copy.
	graph cursor: 200.
	samplingRate := snd originalSamplingRate.
	origSamplingRate := snd originalSamplingRate.
	graph data: snd samples.
	graph scale: 2.0.

	self setVolume: 0.5.
	volume setScaledValue: 0.5.
	
	graph data size > 5000
		ifTrue: [deltaVal := 50]
		ifFalse: [deltaVal := graph data size // 10].

