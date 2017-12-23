accessing
sound: aSampledSound
	"Set my sound."

	self pausePlaying.
	playingSound := nil.
	originalSound := (SampledSound
		samples: aSampledSound samples
		samplingRate: aSampledSound originalSamplingRate).
	compressedSampleRate := compressedBitsPerSample := compressedData := nil.
	savedSound := nil.
