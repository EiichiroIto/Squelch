initialization
initialize

	| parts s |
	super initialize.
	self removeAllMorphs.

	parts := ScratchTranslator labelPartsFor: 'when %m clicked'.

	s := StringMorph new contents: parts first; font: (ScratchFrameMorph getFont: #Label); color: Color white.
	self addMorphBack: s.

	self addMorphBack:
		(UpdatingStringMorph new useStringFormat
			font: (ScratchFrameMorph getFont: #Label);
			color: Color white;
			target: self;
			getSelector: #receiverName).

	s := s veryDeepCopy contents: parts second.
	self addMorphBack: s.
