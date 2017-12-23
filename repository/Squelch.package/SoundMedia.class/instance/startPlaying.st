scratch ops
startPlaying
	"Resume playing if the sound was paused before the end. Otherwise, start playing from the beginning."

	(playingSound isNil or:
	 [playingSound isEmpty or:
	 [playingSound samplesRemaining = 0]])
		ifTrue: [self playFromStart]
		ifFalse: [playingSound resumePlaying].
