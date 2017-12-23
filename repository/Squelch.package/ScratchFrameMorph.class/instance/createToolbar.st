intialization
createToolbar
	"Create and add the toolbar."

	| buttonSpecs bName button |
	toolbarPanel := AlignmentMorph new
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: Color transparent.
		
	buttonSpecs := #(
		"name			selector"			"tooltip"
		(copy			copyTool		'Duplicate')
		(delete			cutTool			'Delete')
		(zoomIn 		zoomInTool		'Grow sprite')
		(zoomOut 		zoomOutTool		'Shrink sprite')
	).

	buttonSpecs do: [:spec |
		bName := spec at: 1.
		button := ToggleButton
			onForm: (ScratchFrameMorph skinAt: (bName, 'ButtonPressed') asSymbol)
			offForm: (ScratchFrameMorph skinAt: (bName, 'Button') asSymbol)
			overForm: (ScratchFrameMorph skinAt: (bName, 'ButtonOver') asSymbol).
		button
			target: self;
			actionSelector: (spec at: 2);
			isMomentary: true;
			setProperty: #balloonText toValue: (spec at: 3) localized.
		toolbarPanel addMorphBack: button].

	self addMorph: toolbarPanel.
