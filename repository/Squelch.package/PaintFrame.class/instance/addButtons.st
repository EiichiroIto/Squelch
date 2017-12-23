initialization
addButtons

	| b |
	fileButtons := AlignmentMorph newRow
		color: Color transparent;
		vResizing: #rigid;
		width: 233";
		inset: 0".

	b := self makeButtonLabel: 'Import' selector:  #import.
	b setProperty: #balloonText toValue: 'Import an image on top of your current canvas' localized.
	fileButtons addMorphBack: b.

	b := ResizableToggleButton2 new
		offForm: (ScratchFrameMorph skinAt: #paintUtilityButton)
			onForm: (ScratchFrameMorph skinAt: #paintUtilityButtonPressed);
		label: 'Clear' localized font: (ScratchFrameMorph getFont: #PaintUtilityButton);
		target: canvasMorph;
		actionSelector: #eraseAll;
		setProperty: #balloonText toValue: 'Clear canvas' localized.
	fileButtons addMorphBack: (AlignmentMorph newSpacer: Color transparent).
	fileButtons addMorphBack: b.

	canvasButtons := AlignmentMorph newRow
		color: Color transparent;
		vResizing: #shrinkWrap";
		inset: 0".

	b := self makeButtonLabel: 'Undo' selector:  #undo.
	b setProperty: #balloonText toValue: 'Undo' localized.
	canvasButtons addMorphBack: b.

	b := self makeButtonLabel: 'Redo' selector:  #redo.
	b setProperty: #balloonText toValue: 'Redo' localized.
	canvasButtons addMorphBack: b.

	self addMorph: fileButtons.
	self addMorph: canvasButtons.
	self addMorph: self makeZoomBar.
