accessing
spriteButtonsTarget: anObject

	buttonPane submorphs do: [:m |
		(m isKindOf: ToggleButton) ifTrue: [
			m target: anObject]].