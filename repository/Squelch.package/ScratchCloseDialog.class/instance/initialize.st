initialization
initialize

	| spacer |
	super initialize.
	self title: 'Quit'.
	self message: 'Save changes before quitting?'.

	"Note: The button row morph was created by initialize; I just replace its contents with a new collection of buttons."
	spacer := Morph new extent: 10@5; color: Color transparent.
	buttonRow removeAllMorphs.

	buttonRow addMorphBack: (AlignmentMorph newSpacer: Color transparent).
	buttonRow addMorphBack: spacer.

	buttonRow addMorphBack: (self buttonLabel: 'Save' localized action: #yes).
	buttonRow addMorphBack: spacer fullCopy.

	buttonRow addMorphBack: (self buttonLabel: 'Don''t Save' localized action: #no).
	buttonRow addMorphBack: spacer fullCopy.

	buttonRow addMorphBack: (self buttonLabel: 'Cancel' localized action: #cancelled).
	buttonRow addMorphBack: spacer fullCopy.

	buttonRow submorphs do: [:b |
		(b isKindOf: ResizableToggleButton2) ifTrue: [tabFields add: b]].
