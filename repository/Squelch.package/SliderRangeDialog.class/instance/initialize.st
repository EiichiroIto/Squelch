initialization
initialize
	"Similar to my superclass, but with a string field for the user's response."

	| minLabel maxLabel |
	super initialize.
	self title: '?'.
	self message: 'Slider range:'.

	minLabel := StringMorph new
		contents: 'Min:' localized;
		forceUnicodeRendering: true;
		font: (ScratchFrameMorph getFont: #StringDialogTypeIn).
	maxLabel := minLabel fullCopy contents: 'Max:' localized.

	minMorph := StringFieldMorph new
		client: self;
		font: (ScratchFrameMorph getFont: #StringDialogTypeIn);
		color: Color transparent;
		width: (40 max: ((maxLabel stringWidth: '100') + 9)).
	maxMorph := minMorph fullCopy.
	tabFields
		add: minMorph;
		add: maxMorph.

	radioButtons := AlignmentMorph newRow color: Color transparent;
		color: self color;
		hResizing: #shrinkWrap;
		centering: #center.
	radioButtons addMorphBack: minLabel.
	radioButtons addMorphBack: (Morph new extent: (5@5); color: Color transparent).
	radioButtons addMorphBack: minMorph.
	radioButtons addMorphBack: (Morph new extent: (5@5); color: Color transparent).
	radioButtons addMorphBack: maxLabel.
	radioButtons addMorphBack: (Morph new extent: (5@5); color: Color transparent).
	radioButtons addMorphBack: maxMorph.
	ScratchTranslator isRTL
		ifTrue: [radioButtons submorphs reversed do: [:m |
			m delete.
			radioButtons addMorphBack: m]].

	mainColumn submorphsDo: [: m |
		((m = messageLineMorphs) not) ifTrue: [m delete]].
	mainColumn
		addMorphBack: messageLineMorphs;
		addMorphBack: (Morph new extent: (5@6); color: Color transparent);
		addMorphBack: radioButtons;
		addMorphBack: (Morph new extent: (5@6); color: Color transparent);
		addMorphBack: buttonRow;
		addMorphBack: bottomSpacer.

	self extent: 200@200.
