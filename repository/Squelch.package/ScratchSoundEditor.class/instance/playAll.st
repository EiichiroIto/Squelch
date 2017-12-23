menu
playAll

	"Resumes playing the selection if there is one, otherwise resumes playing the entire soundtrack."

	graph data size < 2 ifTrue: [^ self].
	playCursor := 1.
	endPlaying := graph data size.

	snd isNil
		ifTrue: [
				 snd := (SampledSound samples: graph data samplingRate: origSamplingRate).
				 snd play.]
		ifFalse: [
			snd reset.
			(graph data = snd samples)
				ifTrue: [snd samplesRemaining = 0 ifTrue: [snd reset].
						 snd resumePlaying.]
				ifFalse: [snd setSamples: graph data samplingRate: origSamplingRate.
						 snd play]]
