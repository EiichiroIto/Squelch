stepping
updateToolButtons
	"Update the highlighting of my tool buttons."

	| toolButtons currentTool |
	Sensor peekAnyButtonPressed ifTrue: [^ self].  "don't update if mouse button pressed"

	toolButtons := toolbarPanel submorphs select: [:m |
		(m isKindOf: ToggleButton) and: [m actionSelector endsWith: 'Tool']].

	currentTool := (World activeHand toolType ifNil: ['none']) asLowercase.
	toolButtons do: [:b |
		(b actionSelector asLowercase = currentTool)
			ifTrue: [b on]
			ifFalse: [b off]].

