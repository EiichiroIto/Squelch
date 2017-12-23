looks ops
multiplySizeBy: factor
	"Used by the magnifying glass tool. Multiply my scale by the given factor."

	self setSizeTo: 100.0 * (self scalePoint x max: self scalePoint y) * factor.
