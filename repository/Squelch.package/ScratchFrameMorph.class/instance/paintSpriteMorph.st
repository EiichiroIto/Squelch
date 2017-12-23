menu/button actions
paintSpriteMorph

	| m |
	m := ScratchSpriteMorph new soleCostume: ImageMedia new.
	self addAndView: m.
	m editDrawingOldCostumeName: m costume mediaName deleteOnCancel: true.
