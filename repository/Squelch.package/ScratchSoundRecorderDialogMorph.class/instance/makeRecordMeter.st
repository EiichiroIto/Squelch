initialization
makeRecordMeter

	recorderBackgroundLeft := (ScratchFrameMorph skinAt: #recorderBackgroundLeft).
	recorderBackgroundCenter := (ScratchFrameMorph skinAt: #recorderBackgroundCenter).
	recorderBackgroundRight := (ScratchFrameMorph skinAt: #recorderBackgroundRight).

	recordMeter := ScratchRecordMeter new.
	mainColumn
		addMorphFront: (Morph new extent: 5@5; color: Color transparent);
		addMorphFront: recordMeter.
