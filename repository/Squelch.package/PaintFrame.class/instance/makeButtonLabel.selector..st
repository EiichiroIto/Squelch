initialization
makeButtonLabel: aString selector: sel

	| font |
	font := (ScratchFrameMorph getFont: #PaintUtilityButton).
	^ ResizableToggleButton2 new
		offForm: (ScratchFrameMorph skinAt: #paintUtilityButton)
			onForm: (ScratchFrameMorph skinAt: #paintUtilityButtonPressed);
		label: aString localized font: font;
		target: canvasMorph;
		actionSelector: sel
