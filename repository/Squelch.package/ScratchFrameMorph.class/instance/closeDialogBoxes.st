view mode
closeDialogBoxes
	"Close all dialog boxes, including PaintEditors and SoundRecorders."

	World submorphs do: [:m |
		(m isKindOf: DialogBoxMorph) ifTrue: [m cancelled; delete]].
