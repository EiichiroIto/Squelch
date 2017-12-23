initialization
initialize

	super initialize.
	copy := nil.
	selection := {nil. nil}.
	scrollDelta := 0.
	deltaVal := 10.
	cursor := 200.
	playCursor := nil.
	samplingRate := SoundPlayer samplingRate.
	soundName := 'sound'.
	self extent: 5@5;
		orientation: #vertical;
		centering: #centered;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		inset: 3;
		color: Color lightGray;
		borderWidth: 2.
	graph := ScratchGraphMorph new extent: 380@150.
	graph editor: self.
	graph selection: selection.
	graph addRuler.
	graph viewer: false.

	viewer := ScratchGraphMorph new extent: 380@30.
	viewer editor: self.
	viewer cursorColorAtZeroCrossings: Color red.
	viewer viewer: true.
	viewer selection: selection.

	self addControls.
	self addPlayButtons.
	self addMorphBack: (Morph new color: self color; extent: 10@5).

	self addGraph.
	self addMorphBack: (Morph newBounds: (0@0 extent: 0@3) color: Color transparent).
	self addSlider.

	self addViewer.
	viewer left: backButton right.
