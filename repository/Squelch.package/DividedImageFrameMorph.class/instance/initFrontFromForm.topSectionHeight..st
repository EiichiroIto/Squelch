initialize
initFrontFromForm: aForm topSectionHeight: aNumber

	| w h |
	super initFrontFromForm: aForm.

	topSectionHeight := aNumber.
	leftMargin := 0.
	rightMargin := 0.
	middleBarForm := ScratchFrameMorph skinAt: #dividedImageFrameBar.

	w := (middleBarForm width // 2) + 2.
	h := middleBarForm height.
	leftJointForm := middleBarForm copy: (0@0 extent: w@h).
	rightJointForm := middleBarForm copy: ((middleBarForm width - w) @ 0 extent: w@h).
