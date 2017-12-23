initialization
playAfterCursor

	| sel currSel |
	graph data size < 2 ifTrue: [^ self].
	

	sel := ((selection at: 1) notNil and: [(selection at: 2) - (selection at: 1) > 3]).
	sel ifTrue: [currSel := graph data copyFrom: (selection at: 1) asInteger to: (selection at: 2) asInteger. playCursor := selection at: 1.
			    endPlaying := selection at: 2.]
	    ifFalse: [currSel := graph data copyFrom: (cursor max: 1) asInteger to: graph data size.
				playCursor := cursor.
				endPlaying := graph data size].
	
		self changed.


	snd isNil
		ifTrue: [
				 snd := (SampledSound samples: currSel samplingRate: origSamplingRate).
				 snd play.]
		ifFalse: [
			currSel = snd samples
				ifTrue: [snd samplesRemaining = 0 ifTrue: [snd reset].
						 snd resumePlaying.]
				ifFalse: [ snd setSamples: currSel samplingRate: origSamplingRate.
						 snd play]].

