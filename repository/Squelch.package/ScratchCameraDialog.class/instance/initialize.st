intialization
initialize

	super initialize.
	self title: 'Camera'.
	self createButtons.
	viewFinderMorph := ImageMorph new form: (Form extent: 320@240 depth: 2) fillBlack.

	mainColumn addMorph: (Morph new extent: 10@12; color: Color transparent).
	mainColumn addMorph: viewFinderMorph.
	mainColumn addMorph: (Morph new extent: 10@18; color: Color transparent).
