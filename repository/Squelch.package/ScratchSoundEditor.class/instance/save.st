graph ops
save

	snd := SampledSound samples: completeSnd samples samplingRate: samplingRate.
	client ifNotNil: [client saveSound: snd name: soundName].
	self delete.
