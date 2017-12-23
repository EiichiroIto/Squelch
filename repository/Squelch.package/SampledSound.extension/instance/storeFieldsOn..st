*Squelch
storeFieldsOn: anObjStream

	self storeFieldsNamed: #(
		envelopes
		scaledVol
		initialCount
		samples
		originalSamplingRate
		samplesSize
		scaledIncrement
		scaledInitialIndex 
	) on: anObjStream.
