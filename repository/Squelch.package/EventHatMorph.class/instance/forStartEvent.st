initialization
forStartEvent

	| parts s m |
	super initialize.
	self removeAllMorphs.

	parts := ScratchTranslator labelPartsFor: 'when %m clicked'.

	s := StringMorph new contents: parts first; font: (ScratchFrameMorph getFont: #Label); color: Color white.
	self addMorphBack: s.

	m := ImageMorph new form: (ScratchFrameMorph skinAt: #goButton).
	self addMorphBack: m.

	s := s veryDeepCopy contents: parts second.
	self addMorphBack: s.

	"create scriptNameMorph but don't add it"
	scriptNameMorph := EventTitleMorph new eventName: 'Scratch-StartClicked'.

	self fixBlockLayout.
