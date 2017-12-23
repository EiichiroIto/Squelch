right button menu
showSmallReadout

	self hideSlider.

	isLarge := false.
	readout font: (ScratchFrameMorph getFont: #Watcher).
	readoutFrame
		borderColor: Color white;
		fixLayout.
	self
		"inset: 2;"
		color: (Color r: (193/255) g: (196/255) b: (199/255));
		borderColor: (Color r: (148/255) g: (145/255) b: (145/255));
		cornerStyle: #rounded.

	self layoutForViewer.
