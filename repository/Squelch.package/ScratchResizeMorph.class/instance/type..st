event handling
type: aSymbol

	type := aSymbol.
	(type = #edge) ifTrue: [
		self addMorphBack: (AlignmentMorph newSpacer: Color transparent).
		self addMorphFront: (AlignmentMorph newSpacer: Color transparent)].
