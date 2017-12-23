initialization
createForegroundBackground

	foreground := BorderedMorph new
		width: 24;
		height: 24;
		borderColor: Color white;
		borderWidth: 1.
	background := foreground fullCopy.

	self addMorphBack: foreground.
	self addMorphBack: background.

	foreground position: 8@7.
	background position: 25@23.

	self foreground: Color black.
	self background: Color white.
