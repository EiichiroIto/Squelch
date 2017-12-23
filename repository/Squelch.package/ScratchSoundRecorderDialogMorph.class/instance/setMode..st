button commands
setMode: aSymbol
	"Update the highlighting of my tool buttons."

	| modeButtons |
	currentMode := aSymbol.
	modeButtons := modeButtonsPane submorphs select: [:m | m isKindOf: ToggleButton].

	modeButtons do: [:b |
		b actionSelector = currentMode
			ifTrue: [b isDisabled: false. b on]
			ifFalse: [b off]].
