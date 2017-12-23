motion ops
pointToX: x y: y
	"Set my heading to point at the given point."

	| delta angle |
	delta := (x@y) - self referencePosition.
	angle := (delta x abs < 0.001)
		ifTrue: [
			delta y < 0 ifTrue: [90] ifFalse: [270]]
		ifFalse: [
			((delta x >= 0 ifTrue: [0] ifFalse: [180])
				- ((delta y / delta x) arcTan * 57.2957795131)) rounded].
	self rotationDegrees: angle.

