initialization
initialize

	super initialize.
	self form: (ScratchFrameMorph skinAt: #paintColorSwitcherPane).
	transparentMorph := ImageMorph new form: (ScratchFrameMorph skinAt: #transparentColorSwitchPanel).
	self createSwitcher.
	self createForegroundBackground.
