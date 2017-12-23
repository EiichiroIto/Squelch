initialization
initialize

	super initialize.
	slider := SimpleSliderMorph new
		minVal: 0; maxVal: 100;
		setValue: 50;
		extent: 128@10.

	self orientation: #horizontal; centering: #center; hResizing: #shrinkWrap;
		borderWidth: 1; borderColor: (Color r: 0.0 g: 0.65 b: 0.0);
		addMorphBack: (sliderMin := self buildNumberBox);
		addMorphBack: (AlignmentMorph new width: 5; color: Color transparent; hResizing: #rigid);
		addMorphBack: slider;
		addMorphBack: (AlignmentMorph new width: 5; color: Color transparent; hResizing: #rigid);
		addMorphBack: (sliderMax := self buildNumberBox).

	sliderMin firstSubmorph
		putSelector: #minVal:;
		getSelector: #minVal.
	sliderMax firstSubmorph
		putSelector: #maxVal:;
		getSelector: #maxVal.
