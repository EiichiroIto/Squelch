private
applyPixelateFilter
	"The absolute value of the raw pixelateCount plus 10 is divided by 10, so 10 gives a 2x2 pixels. This is to make the range scale of this filter similar to other filters such as whirl."

	| factor w h smallImage warpBlt |
	factor := ((pixelateCount abs + 10) // 10) max: 1.
	w := (resultForm width // factor) max: 1.
	h := (resultForm height // factor) max: 1.

	"first, scale the image down"
	smallImage := Form extent: w@h depth: 32.
	warpBlt := (WarpBlt toForm: smallImage)
		sourceForm: resultForm;
		cellSize: 1;  "no smoothing"
		combinationRule: Form over.
	warpBlt copyQuad: resultForm boundingBox corners toRect: smallImage boundingBox.

	"now, scale the small image back up to full size"
	"NOTE: to keep Warpblt from running off the edge for large factors, we reduce the
	  source quad extent by one pixel"
	warpBlt := (WarpBlt toForm: resultForm)
		sourceForm: smallImage;
		combinationRule: Form over.
	warpBlt
		copyQuad: (0@0 extent: smallImage extent - 1) corners
		toRect: resultForm boundingBox.
