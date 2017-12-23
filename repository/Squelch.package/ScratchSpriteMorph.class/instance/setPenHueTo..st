pen ops
setPenHueTo: aNumber
	"Set the pen hue to given number between 0 and 200. (That makes 100 the 'maximum' distance away from the original color on the color wheel.)"

	penHue := aNumber \\ 200.
	self setPenShadeTo:  penShade.  "compute and set penColor"
