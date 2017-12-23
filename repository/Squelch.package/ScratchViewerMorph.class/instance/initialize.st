initialization
initialize

	super initialize.
	self
		initFrontFromForm: (ScratchFrameMorph skinAt: #blocksPaletteFrameTransparent2)
		topSectionHeight: 120.
	self middleBarLeftMargin: 5 rightMargin: 0.
	color := (Color r: 0.584 g: 0.603 b: 0.623).
	pageViewer := ScrollFrameMorph2 new growthFraction: 0.1.
	self addMorphBack: (pageViewer position: self position + (0@120)).
	self target: nil.
	self extent: 214@500.
