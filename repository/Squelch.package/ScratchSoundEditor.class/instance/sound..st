graph ops
sound: aSampledSound

	"completeSnd is a version of the sound that is unaffected by the play mechanism.  This method is called when a SoundMorph brings up a SoundEditor. soundMorphSound is a copy of the initial sampledSound, used for saving and cancelling edits purposes.  It serves as a reference to the original sound so that we can actually change the sound in the soundMorph"

	soundMorphSound := aSampledSound.
	snd := aSampledSound copy.
	completeSnd := snd copy.
	graph cursor: 200.
	samplingRate := snd originalSamplingRate.
	origSamplingRate := snd originalSamplingRate.

	ScratchGraphMorph MinScale: (graph extent x/completeSnd samples size).

	graph data: completeSnd samples.  "SHOULD IT BE COPY?/"
	graph scale: 2.
	graph calculateDataArray.
	"self fixSliderRange.
	graph computeSlider."
	
	viewer data: completeSnd samples.
	viewer scale: 1.
	viewer calculateDataArray.
	self setVolume: snd loudness.
	volume setScaledValue: snd loudness.
	
	(graph data size > 5000)
		ifTrue: [deltaVal := 200]
		ifFalse: [deltaVal := (graph data size) // 10].

	self updateSlider