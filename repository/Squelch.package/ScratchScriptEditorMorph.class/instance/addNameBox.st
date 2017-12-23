initialization
addNameBox

	nameMorph := UpdatingStringFieldMorph new
		font: (ScratchFrameMorph getFont: #UpdatingStringField);
		rightJustify: ScratchTranslator isRTL;
		acceptWhenFocusLost: true;
		position: thumbnailMorph topRight + (17@(thumbnailMorph height * 0.12)).

	self addMorphBack: nameMorph.
