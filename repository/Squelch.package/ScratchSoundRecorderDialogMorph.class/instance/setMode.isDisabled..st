button commands
setMode: aSymbol isDisabled: aBoolean

	| modeButtons |
	modeButtons := modeButtonsPane submorphs select: [:m | m isKindOf: ToggleButton].

	modeButtons do: [:b |
		b actionSelector = aSymbol ifTrue: [b isDisabled: aBoolean]].
