event handling
keyboardFocusChange: aBoolean

	super keyboardFocusChange: aBoolean.
	hasFocus
		ifTrue: [
			self textColor: (Color gray: 0.15).
			self owner color: (ScriptableScratchMorph listBlockColor mixed: 0.4 with: Color white).
			self addMorphBack: deleteMorph.
			self fixLayout]
		ifFalse: [
			self textColor: Color white.
			self owner color: ScriptableScratchMorph listBlockColor.
			deleteMorph delete].
