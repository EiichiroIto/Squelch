initialization
initialize

	super initialize.
	selectedVal := nil.  "if nothing is ever selected, then don't return anything"
	notePlayer := nil.
	self buildKeyboard: 2 baseOctave: 4 keyWidth: 13.
	self setUpNoteDisplay.
