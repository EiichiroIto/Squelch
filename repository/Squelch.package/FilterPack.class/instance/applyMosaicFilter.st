private
applyMosaicFilter
	"The absolute value of the raw mosaic value plus 15 is divided by 10, so 10 gives a 2x2 mosaic. This is to make the range scale of this filter similar to other filters such as whirl."

	| factor w h tempForm warpBlt pts destRect |
	factor := ((((mosaicCount abs + 10) // 10) max: 1) min: resultForm width) min: resultForm height.
	w := resultForm width // factor.
	h := resultForm height // factor.

	"build a grid of (factor x factor) shrunk-down copies in tempForm"
	tempForm := Form extent: (w * factor)@(h * factor) depth: 32.
	warpBlt := (WarpBlt toForm: tempForm)
		sourceForm: resultForm;
		combinationRule: Form over.
	pts := resultForm boundingBox corners.
	0 to: factor - 1 do: [:i |
		0 to: factor - 1 do: [:j |
			destRect := ((i * w) @ (j * h)) extent: (w@h).
			warpBlt copyQuad: pts toRect: destRect]].

	"rescale into resultForm"
	warpBlt := (WarpBlt toForm: resultForm)
		sourceForm: tempForm;
		combinationRule: Form over.
	warpBlt
		copyQuad: tempForm boundingBox corners
		toRect: resultForm boundingBox.

