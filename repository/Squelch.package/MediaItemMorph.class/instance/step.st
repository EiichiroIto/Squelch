event handling
step
	
	Sensor peekAnyButtonPressed ifTrue: [^ self].

	media isSound ifTrue: [
		(media sound notNil and: [media sound isPlaying])
			ifTrue: [
				thumbnailMorph form: SoundIconOn.
				infoMorph contents: media sound currentPosition hhmmss.
				infoMorph color: Color white.
				playButton on. 
				stopButton off]
			ifFalse: [
				thumbnailMorph form: SoundIcon.
				infoMorph contents: media infoString.
				infoMorph color: Color black.
				playButton off. 
				stopButton off]].
