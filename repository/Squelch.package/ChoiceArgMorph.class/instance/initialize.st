initialization
initialize

	super initialize.
	self borderInset.
	self borderWidth: 1.
	self color: Color brown.
	labelMorph := StringMorph new
		font: (ScratchFrameMorph getFont: #Arg);
		forceUnicodeRendering: true;
		color: Color white.
	self addMorph: labelMorph.
	menuIconMorph := ImageMorph new form: DropDownMenuForm.
	self addMorphFront: menuIconMorph.
	isBoolean := false.
	options := #(a b c d).
	self choice: #a.
