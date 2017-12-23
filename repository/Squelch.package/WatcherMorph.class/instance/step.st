stepping
step

	self updateTargetName.
	readoutFrame ifNotNil: [readoutFrame fixLayout].
	scratchSlider ifNotNil: [
		(World activeHand hasMouseFocus: scratchSlider) ifFalse: [
			scratchSlider width: self width - 12.
			scratchSlider updateSliderPosition]].
