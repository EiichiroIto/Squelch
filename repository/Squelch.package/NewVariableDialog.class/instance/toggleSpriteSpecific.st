private
toggleSpriteSpecific

	spriteSpecificFlag := spriteSpecificFlag not.
	spriteSpecificFlag
		ifTrue: [
			allSpritesRadioButton off.
			thisSpriteRadioButton on]
		ifFalse: [
			allSpritesRadioButton on.
			thisSpriteRadioButton off].
