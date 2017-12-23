right button menu
showLargeReadout

	self hideSlider.

	isLarge := true.
	readout font: (ScratchFrameMorph getFont: #WatcherLarge).
	readoutFrame
		borderColor: (Color gray: 3);
		fixLayout.
	watcher removeAllMorphs; addMorphBack: readoutFrame.
	self
		"inset: 0;"
		color: Color transparent;
		borderColor: Color transparent;
		cornerStyle: #square.
