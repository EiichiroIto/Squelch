initialization
initialize

	super initialize.
	self initFromForm: (ScratchFrameMorph skinAt: #btn).
	contentsMorph := ScrollingStringMorph new
		contents: '';
		borderColor: (Color gray: 0.6);
		borderWidth: 1.

	self addMorph: contentsMorph.
	self extent: 140@210.
	self fixLayout.
