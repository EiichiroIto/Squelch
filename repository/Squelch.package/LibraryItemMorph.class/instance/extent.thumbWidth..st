initialization
extent: aRectangle thumbWidth: w

	lastUpdateMSecs := -1.
	self extent: aRectangle.
	thumbWidth := w.

	self buildSubmorphs.
	self target: nil.
	isSelected := nil.
	rolloverOn := false.
	highlightForm := ImageFrameMorph new initFromForm: (ScratchFrameMorph skinAt: #librarySelected).
	highlightForm extent: self extent.
	rolloverForm := ImageFrameMorph new initFromForm: (ScratchFrameMorph skinAt: #libraryRollover).
	rolloverForm extent: self extent.
	currentForm := nil.
	self highlight: false.
