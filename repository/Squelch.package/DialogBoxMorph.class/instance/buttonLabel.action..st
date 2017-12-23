private
buttonLabel: labelString action: actionSelector
	"Answer a new button with the given label and selector. The button target will be me and it will use my button forms."
	"(DialogBoxMorph new buttonLabel: 'Yes' action: #beep) openInWorld"

	| onForm offForm button overForm |
	onForm := ScratchFrameMorph skinAt: #dialogButtonFrameOver.
	offForm := ScratchFrameMorph skinAt: #dialogButtonFrame.
	overForm := ScratchFrameMorph skinAt: #dialogButtonFrame.

	button := ResizableToggleButton2 new
		offForm: offForm
		onForm: onForm
		overForm: overForm.

	^ button
		padding: 39@22;
		label: labelString font: (ScratchFrameMorph getFont: #DialogBoxButton);
		target: self;
		actionSelector: actionSelector;
		setLabelColor: (Color gray: 0.15)
