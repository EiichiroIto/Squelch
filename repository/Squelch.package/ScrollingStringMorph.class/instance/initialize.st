initialization
initialize

	super initialize.
	borderWidth := 2.
	color := Color transparent.
	textColor := Color black.
	selectionColor := Color r: 0.353 g: 0.607 b: 0.788.
	lines := Array with: self emptyLine.
	isEditable := true.
	hasFocus := false.
	selectionStart := selectionEnd := 1.
	blinkState := true.
	layoutNeeded := false.

	scrollbar := ScratchScrollBar newVertical
		width: 16;
		target: self;
		selector: #scrollRelative:.
	firstVisibleLine := 1.
	self addMorph: scrollbar.

	self font: TextStyle defaultFont.
	self extent: 150@300.
