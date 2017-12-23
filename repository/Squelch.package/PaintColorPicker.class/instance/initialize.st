initialization
initialize

	super initialize.
	selectedColor := Color black.
	target := selector := nil.
	self createColorPickers.
	self extent: 20@20.
