intialization
addShortcutButtonsTo: rowMorph

	| buttonSpecs b |
	buttonSpecs := #(
		"name		tool tip				selector"
		(language	'Set language'		languageMenu:)
		(save		'Save this project'	saveScratchProjectNoDialog)
	).

	buttonSpecs do: [:spec |
		b := ToggleButton
			onForm: (ScratchFrameMorph skinAt: (spec at: 1), 'ButtonOver')
			offForm: (ScratchFrameMorph skinAt: (spec at: 1), 'Button')
			overForm: (ScratchFrameMorph skinAt: (spec at: 1), 'ButtonOver').
		b
			target: self;
			actionSelector: (spec at: 3);
			setBalloonText: (spec at: 2) localized;
			actWhen: #buttonUp;
			isMomentary: true.
		
		('language' = (spec at: 1)) ifTrue: [  "language special case"
			b arguments: (Array with: b)].

		('save' = (spec at: 1)) ifTrue: [  "spacer"
			rowMorph addMorphBack: (Morph new extent: (10@5); color: Color transparent)].

		rowMorph addMorphBack: b].

	rowMorph addMorphBack: (Morph new extent: (20@5); color: Color transparent).
