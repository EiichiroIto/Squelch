menu
saveToFile
	"Export my samples to a WAV file."

	| fileName samples f |
	fileName := StringDialog ask: 'File name?'.
	fileName size = 0 ifTrue: [^ self].
	(fileName asLowercase endsWith: '.wav') ifFalse: [fileName := fileName, '.wav'].
	(graph data isKindOf: SoundBuffer)
		ifTrue: [samples := graph data]
		ifFalse: [samples := SoundBuffer fromArray: graph data].
	f := (FileStream newFileNamed: fileName) binary.
	(SampledSound samples: samples samplingRate: samplingRate) storeWAVSamplesOn: f.
	f close.
