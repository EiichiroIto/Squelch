initialization
initialize

	super initialize.
	self color: (Color r: 0.8 g: 0.8 b: 0.6).
	self extent: 365@80.
	self borderWidth: 2.
	dataColor := Color darkGray.
	cursorColor := Color red.
	playCursorColor := Color blue.
	cursorColorAtZeroCrossings := Color red.
	startIndex := 1.
	viewer := false.
	selection := {nil. nil}.
	scale := 1.0.
	hasChanged := false.
	posVals := negVals := nil.

	self data:
		((0 to: 360 - 1) collect:
			[:x | (100.0 * (x degreesToRadians sin)) asInteger]).

	
	
