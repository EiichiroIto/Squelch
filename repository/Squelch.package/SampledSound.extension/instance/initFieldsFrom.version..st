*Squelch
initFieldsFrom: anObjStream version: classVersion

	self initFieldsNamed: #(
		envelopes
		scaledVol
		initialCount
		samples
		originalSamplingRate
		samplesSize
		scaledIncrement
		scaledInitialIndex 
	) from: anObjStream.
