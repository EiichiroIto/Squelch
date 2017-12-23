initialization
initialize

	super initialize.
	self
		initFrontFromForm: (ScratchFrameMorph skinAt: #scriptPaneFrameTransparent2)
		topSectionHeight: 90.
	self color: (Color r: (149/255) g: (154/255) b: (159/255)).

	thumbnailMorph := ScratchThumbnailMorph new.
	self addMorph: (thumbnailMorph position: self position + (37@16)).

	self addNameBox.

	pageViewerMorph := ScrollFrameMorph2 new
		growthFraction: 0.1;
		color: ScratchFrameMorph scriptsPaneColor.
	self addMorph: (pageViewerMorph position: (self left @ (self top + topSectionHeight))).

	rotationButtons := #().
	readoutMorphs := #().
	self target: nil.
	thumbnailMorph extent: 50@50.
	self extent: 300@400.
	self createTabPane.
