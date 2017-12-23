initialization
initialize

	| parts s |
	super initialize.
	self removeAllMorphs.

	parts := ScratchTranslator labelPartsFor: 'when %k key pressed'.

	s := StringMorph new
		contents: parts first; font: (ScratchFrameMorph getFont: #Label);
		color: Color white.
	self addMorphBack: s.

	scriptNameMorph := ChoiceArgMorph new
		getOptionsSelector: #keyNames;
		options: ScriptableScratchMorph new keyNames;
		choice: 'space'.
	self addMorphBack: scriptNameMorph.

	s := s veryDeepCopy contents: parts second.
	self addMorphBack: s.
