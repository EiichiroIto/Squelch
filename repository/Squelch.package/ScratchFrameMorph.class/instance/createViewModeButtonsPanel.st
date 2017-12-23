intialization
createViewModeButtonsPanel

	| specs bName button |
	viewModeButtonsPanel := AlignmentMorph newRow
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: Color transparent.

	viewModeButtons := OrderedCollection new.
	specs := OrderedCollection new.
	specs add: #(quarter			enterQuarterMode		'Switch to small stage').
	specs add: #(normal			enterNormalMode		'Switch to full stage').
	specs add: #(presentation	enterPresentationMode	'Switch to presentation mode').

	specs do: [:spec |
		bName := spec first.
		button := ToggleButton new
			onForm: (ScratchFrameMorph skinAt: bName, 'ViewModeOn')
			offForm: (ScratchFrameMorph skinAt: bName, 'ViewMode')
			overForm: (ScratchFrameMorph skinAt: bName, 'ViewModeOver').
		button
			target: self;
			actionSelector: (spec at: 2);
			alphaOn: true;
			setProperty: #balloonText toValue: (spec at: 3) localized.
		viewModeButtonsPanel
			addMorphBack: button;
			addMorphBack: (Morph new extent: 1@5; color: Color transparent).
		viewModeButtons add: button].

	self addMorph: viewModeButtonsPanel.
