initialization
initialize

	super initialize.
	reversed := false.
	self
		color: Color transparent;
		addMorph: ImageMorph new.
