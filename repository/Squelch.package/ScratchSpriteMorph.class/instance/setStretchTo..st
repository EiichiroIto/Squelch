looks ops
setStretchTo: percent
	"Set x stretch percent relative to y. For example, a stretch of 200 stretches x by a factor of two relative to y while a stretch of 50 compresses x by a factor of two. As my stretch is changed, my x scale changes but my y scale remains the same."

	| baseScale origExtent minStretch maxStretch newStretchFactor |
	baseScale := scalePoint y.
	origExtent := self costumeForm extent.
	minStretch := 8.0 / (baseScale * origExtent x).  "min width 8 pixels"
	maxStretch := 500.0 / (baseScale * origExtent x). "max width 500 pixels"
	newStretchFactor := ((percent max: 0) / 100.0) min: maxStretch max: minStretch.
	self scalePoint: baseScale * (newStretchFactor @ 1.0).
