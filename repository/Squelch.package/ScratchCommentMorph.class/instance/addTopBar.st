initialization
addTopBar

	| topBarMorph |
	topBarMorph := AlignmentMorph newRow
		extent: (140@12);
		vResizing: #rigid;
		hResizing: #spaceFill;
		color: self topBarColor;
		borderWidth: 0;
		"inset: 0;"
		wrapCentering: #center.

	labelMorph := StringMorph new
		color: (Color gray: 0.33);
		contents: '';
		font: (ScratchFrameMorph getFont: #Label).

	showHideMorph := ImageMorph new form: (ScratchFrameMorph skinAt: #arrowOpenComment).
	showHideMorph form colors: (Array
		with: Color transparent
		with: (self color mixed: 0.5 with: Color black)).

	topBarMorph
		addMorphBack: (Morph new extent: 5@5; color: Color transparent);
		addMorphBack: showHideMorph;
		addMorphBack: (Morph new extent: 3@5; color: Color transparent);
		addMorphBack: labelMorph;
		addMorphBack: (AlignmentMorph newSpacer: Color transparent).

	self addMorphBack: topBarMorph.
