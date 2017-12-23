menu
openWaveEditor

	| factor scaledData |
	self data: data.  "make sure maxVal and minVal are current"
	factor := 32767 // ((minVal abs max: maxVal abs) max: 1).
	scaledData := SoundBuffer newMonoSampleCount: data size.
	1 to: data size do: [:i | scaledData at: i put: (factor * (data at: i)) truncated].
	(SimpleWaveEditor new
		data: scaledData;
		samplingRate: 11025) openInWorld.
