private
applyPointillizeFilter
	"Pointillize the image with rectanges as big as 'size'."

	| sz dot offset colorMap count alpha bitblt x y thisColorPix |
	pointillizeForm ifNil: [pointillizeForm := cachedForm deepCopy].
	sz := pointillizeSize asInteger abs.
	sz := sz min: ((pointillizeForm width min: pointillizeForm height) // 2).
	dot := Form dotOfSize: sz.
	offset := sz // 2.
	colorMap := Bitmap new: 2.
	colorMap at: 1 put: 0.  "transparent"
	count := (pointillizeForm width * pointillizeForm height) // (50 * sz).
	alpha := 120.  "alpha can be 0 to 255"

	bitblt := (BitBlt toForm: pointillizeForm)
		sourceForm: dot;
		sourceRect: dot boundingBox;
		combinationRule: 31;  "alpha paint with constant alpha"
		colorMap: colorMap.

	1 to: count do: [:i |
		x := self rand \\ pointillizeForm width.
		y := self rand \\ pointillizeForm height.
		thisColorPix := cachedForm bits at: ((y * pointillizeForm width) + x + 1).
		colorMap at: 2 put: thisColorPix.
		bitblt destOrigin: (x - offset)@(y - offset); copyBitsTranslucent: alpha].

	resultForm := pointillizeForm deepCopy.

