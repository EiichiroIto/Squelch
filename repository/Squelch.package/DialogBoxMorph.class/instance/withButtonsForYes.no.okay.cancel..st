initialization
withButtonsForYes: yesFlag no: noFlag okay: okayFlag cancel: cancelFlag
	"Replace my current buttons with the ones specified."
	"Note: The button row morph was created by initialize; I just replace its contents with a new collection of buttons."

	| spacer |
	spacer := Morph new extent: 10@5; color: Color transparent.
	buttonRow removeAllMorphs.

	buttonRow addMorphBack: (AlignmentMorph newSpacer: Color transparent).
	buttonRow addMorphBack: spacer.
	yesFlag ifTrue: [
		buttonRow addMorphBack: (self buttonLabel: 'Yes' localized action: #yes).
		buttonRow addMorphBack: spacer fullCopy].

	noFlag ifTrue: [
		buttonRow addMorphBack: (self buttonLabel: 'No' localized action: #no).
		buttonRow addMorphBack: spacer fullCopy].

	okayFlag ifTrue: [
		buttonRow addMorphBack: (self buttonLabel: 'OK' localized action: #yes).
		buttonRow addMorphBack: spacer fullCopy].

	cancelFlag ifTrue: [
		buttonRow addMorphBack: (self buttonLabel: 'Cancel' localized action: #cancelled).
		buttonRow addMorphBack: spacer fullCopy].

	buttonRow submorphs do: [:b |
		(b isKindOf: ResizableToggleButton2) ifTrue: [tabFields add: b]].
