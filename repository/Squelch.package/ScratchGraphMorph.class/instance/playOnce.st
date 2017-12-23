commands
playOnce

	| factor absV scaledData |
	data isEmpty ifTrue: [^ self].  "nothing to play"
	factor := 1.
	data do: [:v | (absV := v abs) > factor ifTrue: [factor := absV]].
	factor := 32767.0 / factor.
	scaledData := SoundBuffer newMonoSampleCount: data size.
	1 to: data size do: [:i |
		scaledData at: i put: (factor * (data at: i)) truncated].
	(SampledSound samples: scaledData samplingRate: 11025) play.
