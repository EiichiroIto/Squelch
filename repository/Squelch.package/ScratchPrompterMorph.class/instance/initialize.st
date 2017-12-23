initialize
initialize
	"Set the forms for all my UI elements, create a row to hold my buttons, and a column to hold my shortcut buttons."

	super initialize.
	self initFromForm: (ScratchFrameMorph skinAt: #promptBubbleFrame).
	done := false.

	typeinMorph := StringFieldMorph
		new client: self;
		borderWidth: 2;
		color: (Color gray: 55);
		font: (ScratchFrameMorph getFont: #StringDialogTypeIn).

	okButton := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #promptCheckButtonPressed)
		offForm: (ScratchFrameMorph skinAt: #promptCheckButton).
	okButton
		target: self;
		actionSelector: #accept;
		actWhen: #buttonDown;
		toggleMode: false;
		setBalloonText: 'Close and continue' localized.

	ScratchTranslator isRTL
		ifTrue: [self addMorph: okButton.
			self addMorph: typeinMorph]
		ifFalse: [self addMorph: typeinMorph.
			self addMorph: okButton].

	self extent: 450@37.
