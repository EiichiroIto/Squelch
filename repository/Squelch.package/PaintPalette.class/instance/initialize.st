initialization
initialize

	super initialize.
	self borderWidth: 0.
	self color: Color transparent.
	self createOptionsPane.
	self createColorSwitcher.
	self addToolbarButtons.
	self brushSize: 3.
	eraserSize := 13.
	toolbarButtons computeBounds.
	self extent: (toolbarButtons width)@(100 + toolbarButtons height).
	self shapeFilling: true.
	self pbFillStyle: #color.
	showRotationCenter := false.
	self mode: #paint.
	self storedColor: colorSwitcher foreground.
	self updateOptionsPane.
