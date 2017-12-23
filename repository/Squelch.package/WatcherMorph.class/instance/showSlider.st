right button menu
showSlider

	self hideSlider.
	self showSmallReadout.

	scratchSlider := WatcherSliderMorph new
		target: readout target;
		actionSelector: #setVar:to:;
		arguments: (Array with: self getVariable);
		truncate: (sliderMin isInteger & sliderMax isInteger);
		minVal: sliderMin;
		maxVal: sliderMax;
		sliderThickness: 0;
		height: 10;
		width: self width - 12.

	self addMorphBack: scratchSlider.
	self world ifNotNil: [self world startSteppingSubmorphsOf: scratchSlider].
	scratchSlider updateSliderPosition.
