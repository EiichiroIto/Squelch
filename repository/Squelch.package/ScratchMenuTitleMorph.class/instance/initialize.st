initialization
initialize

	super initialize.
	self
		font: (ScratchFrameMorph getFont: #MenuTitle);
		forceUnicodeRendering: true;
		color: self normalColor.
