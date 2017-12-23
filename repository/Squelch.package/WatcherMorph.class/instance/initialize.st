initialization
initialize

	super initialize.
	titleMorph := StringMorph contents: '???'.
	titleMorph font: (ScratchFrameMorph getFont: #Watcher).
	readout := readoutFrame := scratchSlider := nil.
	lastTargetName := nil.
	isSpriteSpecific := true.
	isLarge := false.
	sliderMin := 0.
	sliderMax := 100.
	watcher := AlignmentMorph new
		color: Color transparent;
		borderWidth: 0;
		"inset: 0;"
		listDirection: #leftToRight;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		wrapCentering: #center.
	self 
		color: (Color r: (193/255) g: (196/255) b: (199/255));
		borderWidth: 1;
		borderColor: (Color r: (148/255) g: (145/255) b: (145/255));
		listDirection: #leftToRight;
		wrapCentering: #center;
		"inset: 2;"
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		buildReadout;
		useRoundedCorners;
		addMorphBack: watcher;
		addMorphBack: (Morph new color: Color transparent; extent: 5@1).
