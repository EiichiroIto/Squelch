accessing
highlight: aBoolean

	highlightMorph ifNil: [^ self].
	aBoolean
		ifTrue: [
			highlightMorph position: (self topLeft + numberMorphTopRight).
			highlightMorph owner = self ifFalse: [
				self addMorphBack: highlightMorph]]
		ifFalse: [
			highlightMorph owner = self ifTrue: [highlightMorph delete]].
