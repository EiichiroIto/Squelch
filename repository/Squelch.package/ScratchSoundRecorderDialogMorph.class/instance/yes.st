button commands
yes

	| samples samplingRate snd |
	self stop.
	samples := recorder condensedSamples.
	samplingRate := recorder samplingRate.
	samplingRate = 44100 ifTrue: [
		samples := samples downSampledLowPassFiltering: false.
		samplingRate := 22050].
	snd := SampledSound samples: samples samplingRate: samplingRate.
	(client notNil and: [samples size > 0]) ifTrue: [
		client saveSound: snd name: 'recording' localized,'1'].
	recorder clearRecordedSound.
	super yes.
