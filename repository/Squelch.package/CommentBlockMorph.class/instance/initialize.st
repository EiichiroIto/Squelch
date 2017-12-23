initialization
initialize

	super initialize.
	self color: (Color r: 0.670 g: 0.685 b: 0.670).
	isShowing := true.

	labelMorph := (StringMorph contents: 'comment' localized font: (ScratchFrameMorph getFont: #Label)) color: LabelColor.
	self addMorph: labelMorph.

	commentMorph := MultilineStringMorph new
		growWithText: true;
		borderWidth: 1;
		borderColor: color darker;
		font: (ScratchFrameMorph getFont: #CommentBlock);
		contents: '';
		width: 160;
		color: (Color gray: 0.88).
	self addMorph: commentMorph.

	showHideMorph := ImageMorph new form: (ScratchFrameMorph skinAt: #arrowOpenComment).
	showHideMorph form colors: (Array
		with: Color transparent
		with: (self color mixed: 0.5 with: Color black)).
	self addMorph: showHideMorph.

	self fixBlockLayout.
