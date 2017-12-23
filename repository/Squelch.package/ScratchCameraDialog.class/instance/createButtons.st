intialization
createButtons
"Replace my current buttons with the ones specified."
	"Note: The button row morph was created by initialize; I just replace its contents with a new collection of buttons."

	| spacer |
	spacer := Morph new extent: 10@5; color: Color transparent.
	buttonRow removeAllMorphs.

	buttonRow addMorphBack: (AlignmentMorph newSpacer: Color transparent).
	buttonRow addMorphBack: spacer.
	
	buttonRow addMorphBack: self cameraButton.
	buttonRow addMorphBack: spacer fullCopy.

	buttonRow addMorphBack: (self buttonLabel: 'Done' localized action: #close).
	buttonRow addMorphBack: spacer fullCopy.

	buttonRow submorphs do: [:b |
		(b isKindOf: ResizableToggleButton2) ifTrue: [tabFields add: b]].
