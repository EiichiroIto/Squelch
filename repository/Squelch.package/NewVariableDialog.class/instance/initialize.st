initialization
initialize

	| label1 label2 |
	super initialize.
	spriteSpecificFlag := false.

	radioButtons := AlignmentMorph newRow
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.

	allSpritesRadioButton := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #radioButtonOn)
		offForm: (ScratchFrameMorph skinAt: #radioButton).
	allSpritesRadioButton
		on;
		target: self;
		actionSelector: #toggleSpriteSpecific.
	label1 := StringMorph new
		contents: ('For all sprites' localized);
		font: (ScratchFrameMorph getFont: #NewVariableDialogBox).
	radioButtons addMorphBack: allSpritesRadioButton.
	radioButtons addMorphBack: (Morph new extent: (5@5); color: Color transparent).
	radioButtons addMorphBack: label1.
	radioButtons addMorphBack: (Morph new extent: (15@5); color: Color transparent).

	thisSpriteRadioButton := allSpritesRadioButton fullCopy off.
	label2 := StringMorph new
		contents: ('For this sprite only' localized);
		font: (ScratchFrameMorph getFont: #NewVariableDialogBox).
	radioButtons addMorphBack: thisSpriteRadioButton.
	radioButtons addMorphBack: (Morph new extent: (5@5); color: Color transparent).
	radioButtons addMorphBack: label2.

	ScratchTranslator isRTL
		ifTrue: [radioButtons submorphs reversed do: [:m |
			m delete.
			radioButtons addMorphBack: m]].

	mainColumn submorphsDo: [: m |
		((m = messageLineMorphs) not) ifTrue: [m delete]].
	mainColumn
		addMorphBack: (Morph new extent: (5@6); color: Color transparent);
		addMorphBack: typeinMorph;
		addMorphBack: (Morph new extent: (5@7); color: Color transparent);
		addMorphBack: radioButtons;
		addMorphBack: (Morph new extent: (5@7); color: Color transparent);
		addMorphBack: buttonRow;
		addMorphBack: bottomSpacer.
