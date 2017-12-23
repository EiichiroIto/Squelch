initialization
initialize

	super initialize.
	self
		color: (Color r: (193/255) g: (196/255) b: (199/255));
		borderWidth: 2;
		borderColor: self normalBorderColor;
		useRoundedCorners.

	cellMorphs := OrderedCollection new: 1000.
	numberMorphs := #().
	listLayoutNeeded := true.
	focusIndex := 0.
	lastActivityError := false.
	highlightActive := false.

	self addTitleAndControls.
	self addScrollPane.

	self extent: 65@115.
