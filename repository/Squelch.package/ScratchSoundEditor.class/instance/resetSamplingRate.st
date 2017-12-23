menu
resetSamplingRate

	snd ifNil: [^self].

	snd setSamples: snd samples samplingRate: origSamplingRate.
	rateSlider setScaledValue: 1.0.