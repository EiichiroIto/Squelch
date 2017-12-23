private
buildButtons
	"Build my directory bar, parent buttons, and new folder button."

	| b f |
	topBarMorph := AlignmentMorph newRow
		hResizing: #spaceFill;
		vResizing: #rigid;
		wrapCentering: #center;
		color: Color transparent.
	directoryBarArrowMorph := ImageMorph new form: (ScratchFrameMorph skinAt: #directoryBarArrow).
	directoryBarMorph := ResizableToggleButton2 new
		offForm: (ScratchFrameMorph skinAt: #directoryBar)
		onForm: (ScratchFrameMorph skinAt: #directoryBar);
		padding: 3@5.
	directoryBarMorph
		target: self;
		actionSelector: #directoryMenu;
		actWhen: #buttonUp.
	topBarMorph
		addMorphBack: (Morph new extent: (5@5); color: Color transparent);
		addMorphBack: directoryBarMorph.

	b := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #parentDirectoryButtonOn)
		offForm: (ScratchFrameMorph skinAt: #parentDirectoryButton).
	b
		target: self;
		actionSelector: #showParentDirectory;
		actWhen: #buttonUp;
		isMomentary: true.
	topBarMorph
		addMorphBack: (Morph new extent: (5@5); color: Color transparent);
		addMorphBack: (b position: self position + (252@16)).

	f := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #newFolderIconSelected)
		offForm: (ScratchFrameMorph skinAt: #newFolderIcon).
	f
		target: self;
		actionSelector: #newDirectory;
		actWhen: #buttonUp;
		isMomentary: true.
	topBarMorph
		addMorphBack: (Morph new extent: (5@5); color: Color transparent);
		addMorphBack: (f position: self position + (274@16)).

	directoryBarMorph
		label: '<directory>' font: (ScratchFrameMorph getFont: #FilePickerDirectoryName);
		leftJustifyInset: 9.

	self addMorphFront: (directoryBarArrowMorph position: self topLeft + ((b left - 32)@((50 - directoryBarArrowMorph height) // 2))).
	self addMorphBack: (topBarMorph position: self topLeft + (5@5)).
