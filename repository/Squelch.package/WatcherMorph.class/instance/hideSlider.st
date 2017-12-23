right button menu
hideSlider

	scratchSlider ifNotNil: [
		sliderMin := scratchSlider minVal.
		sliderMax := scratchSlider maxVal.
		scratchSlider delete.
		scratchSlider := nil].
