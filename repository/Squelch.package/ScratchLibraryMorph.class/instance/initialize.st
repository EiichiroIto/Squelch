initialization
initialize

	super initialize.
	self buildPanes.
	self
		initFrontFromForm: (ScratchFrameMorph skinAt: 'spriteLibraryPaneFrameTransparent2')
		topSectionHeight: ((spriteLabel height + 10) max: 40).
	self middleBarLeftMargin: 0 rightMargin: 6.
	self extent: 200@100.
