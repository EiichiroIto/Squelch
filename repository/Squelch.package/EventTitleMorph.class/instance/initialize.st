initialization
initialize

	super initialize.
	self borderInset.
	self borderWidth: 1.
	self color: Color brown.

	menuIconMorph := ImageMorph new form: DropDownMenuForm.
	self addMorphFront: menuIconMorph.

	labelMorph := StringMorph new
		font: (ScratchFrameMorph getFont: #Arg);
		forceUnicodeRendering: true;
		color: Color white.
	self addMorph: labelMorph.
	self eventName: ''.
