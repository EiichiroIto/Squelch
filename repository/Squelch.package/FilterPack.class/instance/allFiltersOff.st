filtering
allFiltersOff
	"Answer true if all my filters are off."

	^ ((hueShift = 0) &
	   (saturationShift = 0) &
	   (brightnessShift = 0) &
	   (mosaicCount abs < 5) &
	   (pixelateCount abs < 5) &
	   (fisheye = 0) &
	   (whirl = 0) &
	   (blur = 0) &
	   (pointillizeSize = 0) &
	   (waterRippleRate = 0))
