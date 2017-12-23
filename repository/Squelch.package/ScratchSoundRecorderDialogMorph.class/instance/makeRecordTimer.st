initialization
makeRecordTimer

	"timer"
	timerMorph := StringMorph  "morph to display the duration"
		contents: (self convertToMmss: 0)
		font: (ScratchFrameMorph getFont: #SoundRecorderTimer).
	timerMorph color: Color darkGray.
	fileInfoColumn
		addMorphBack: (Morph new extent: (5@5); color: Color transparent);
		addMorphBack: timerMorph.
