utilities
buttonLabel: aString selector: aSymbolOrNil
	"Answer a big button with the given label."

	| button |
	button := ResizableToggleButton2 new
		offForm: (ScratchFrameMorph skinAt: #btn)
			onForm: (ScratchFrameMorph skinAt: #btnPressed);
		label: aString font: (ScratchFrameMorph getFont: #Button);
		actionSelector: aSymbolOrNil.

	^ button
