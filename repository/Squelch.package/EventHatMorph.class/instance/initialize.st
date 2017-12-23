initialization
initialize

	| parts label |
	super initialize.
	self removeAllMorphs.

	parts := ScratchTranslator labelPartsFor: 'when I receive %e'.

	parts first size > 0 ifTrue: [
		label := StringMorph contents: parts first font: (ScratchFrameMorph getFont: #Label).
		label color: Color white.
		self addMorphBack: label].

	scriptNameMorph := EventTitleMorph new.
	self addMorphBack: scriptNameMorph.

	parts second size > 0 ifTrue: [
		label := (StringMorph contents: parts second font: (ScratchFrameMorph getFont: #Label)) color: Color white.
		self addMorphBack: label].
