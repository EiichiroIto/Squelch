initialization
initialize

	super initialize.
	self
		color: Color transparent;
		listDirection: #topToBottom;
		wrapCentering: #center;
		hResizing: #rigid;
		vResizing: #rigid;
		"inset: 0;"
		borderWidth: 0.
	self
		addMorph: ImageMorph new.
