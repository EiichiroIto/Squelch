looks ops
setSizeTo: percent
	"Set my size to the given percent of the original size. Limit the range to avoid accidentally making me invisibly tiny or really huge. Retain my aspect ratio (i.e., my stretch)."

	| origExtent minExtent maxExtent minScale maxScale |
	origExtent := self costumeForm extent asFloatPoint.
	minExtent := (origExtent min: 5@5) asFloatPoint.
	maxExtent := ScratchFrameMorph workpaneExtent asFloatPoint * 1.5.
	minScale := ((minExtent x / origExtent x) max: (minExtent y / origExtent y)) min: 1.0.
	maxScale := (maxExtent x / origExtent x) min: (maxExtent y / origExtent y).
	self scalePoint: ((percent / 100.0) min: maxScale max: minScale) asPoint.

"old code that maintained the aspect ratio (stretch):
	stretchFactor := scalePoint x / scalePoint y.
	origExtent := self costumeForm extent.
	minScale := (8.0 / (stretchFactor * origExtent x)) max: (8.0 / origExtent y).  .min size 8 pixels.
	maxScale := (500.0 / (stretchFactor * origExtent x)) min: (500.0 / origExtent y). .max size 500 pixels.
	newScale := (percent / (100.0 * stretchFactor)) within: minScale and: maxScale.
	self scalePoint: newScale * (stretchFactor @ 1.0).
xxx"
