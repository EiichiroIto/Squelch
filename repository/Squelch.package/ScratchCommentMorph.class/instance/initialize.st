initialization
initialize

	| bottomBar |
	super initialize.
	anchorOffset := 5.

	self vResizing: #shrinkWrap;
		hResizing: #rigid;
		listDirection: #topToBottom;
		wrapCentering: #bottomRight;
		"inset: 0;"
		borderWidth: 0;
		color: self commentMorphColor;
		useRoundedCorners;
		width: self defaultWidth.
	isShowing := true.

	self addTopBar.

	bottomBar := AlignmentMorph newRow
		color: Color transparent;
		wrapCentering: #center.
	resizeMorph := ScratchResizeMorph ofType: #edge.
	resizeMorph vResizing: #spaceFill.
	commentMorph := MultilineStringMorph new
		color: self commentMorphColor;
		growWithText: true;
		borderWidth: 0;
		font: (ScratchFrameMorph getFont: #CommentBlock);
		contents: 'add comment here' localized, ScratchTranslator ellipsesSuffix;
		width: self defaultWidth - resizeMorph width.
	bottomBar addMorphBack: commentMorph.
	bottomBar addMorphBack: resizeMorph.

	self addMorphBack: bottomBar.
	isResizing := false.
	resizeOffset := 0@0.
