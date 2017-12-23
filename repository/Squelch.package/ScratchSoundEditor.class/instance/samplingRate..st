menu
samplingRate: sampleRate

"Sets the samplingRate to somewhere btw 0.1 and 2.5 the original samplingRate, given a number btw 0.2 and 2.5 (sampleRate)"

	snd ifNil: [^self.].

	origSamplingRate = 0 
		ifFalse: [snd setSamples: snd samples samplingRate: (sampleRate*origSamplingRate)]
		ifTrue: [ snd setSamples: snd samples samplingRate: (sampleRate*10000)].

	
