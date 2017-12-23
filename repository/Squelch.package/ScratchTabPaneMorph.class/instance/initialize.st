initialization
initialize

	| barFormSource |
	super initialize.
	self color: Color red.
	self extent: 100@1.
	
	barFormSource := ScratchFrameMorph skinAt: #dividedImageFrameBar.
	barForm := barFormSource copy: (((barFormSource width // 2) @ 0) extent: (1 @ barFormSource height))
