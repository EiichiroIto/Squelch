initialization
initialize

	super initialize.

	stringMorph := StringMorph new
		contents: '';
		font: (StrikeFont fontName: 'Verdana' size: 12);
		forceUnicodeRendering: true.
	self addMorph: stringMorph.

	color := (Color gray: 0.9).
	doResizing := false.
	isNumeric := false.
	isEditable := true.
	isKeyboardFocus := false.
	acceptWhenFocusLost := false.
	self keyboardFocusChange: false.
	selectionColor := (Color r: 0.353 g: 0.607 b: 0.788).
	selectionStart := selectionEnd := 0.
	self recordUndoState.
	self rightJustify: ScratchTranslator isRTL.

	self borderInset; useNoFrame.
	self width: 100.