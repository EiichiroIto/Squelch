initialization
initialize

	| s1 s2 |
	super initialize.
	argMorph := BooleanArgMorph new.
	lastState := false.

	s1 := 'when' localized.
	s2 := 'is true' localized.
	self removeAllMorphs.
	self addMorphBack: ((StringMorph contents: s1 font: (ScratchFrameMorph getFont: #Label)) color: Color white).
	self addMorphBack: argMorph.
	self addMorphBack: ((StringMorph contents: s2 font: (ScratchFrameMorph getFont: #Label)) color: Color white).
