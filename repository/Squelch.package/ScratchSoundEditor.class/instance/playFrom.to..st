menu
playFrom: start to: end

	| sz i1 i2 snd2 |
	sz := graph data size.
	i1 := ((start + 1) min: sz) max: 1.
	i2 := ((end + 1) min: sz) max: i1.
	(i1 + 2) >= i2 ifTrue: [^ self].
	snd2 := SampledSound
		samples: (graph data copyFrom: i1 to: i2)
		samplingRate: samplingRate.
	snd2 play.
