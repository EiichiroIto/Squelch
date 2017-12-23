right button menu
setSliderMinAndMax

	| newRange |
	newRange := SliderRangeDialog initialMin: sliderMin max: sliderMax.
	newRange ifNil: [^ self].

	sliderMin := newRange first.
	sliderMax := newRange last.
	scratchSlider ifNotNil: [
		scratchSlider
			minVal: sliderMin;
			maxVal: sliderMax;
			truncate: (sliderMin isInteger & sliderMax isInteger);
			updateSliderPosition].
