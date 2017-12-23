initialization
createOptionsPane

	optionsPane := ImageFrameMorph2 new initFromForm: (ScratchFrameMorph skinAt: #paintOptionsBackground).
	optionsPane extent: 232@44;
	changeTableLayout;
	listCentering: #center;
	wrapCentering: #center.
	self addMorphBack: optionsPane.
