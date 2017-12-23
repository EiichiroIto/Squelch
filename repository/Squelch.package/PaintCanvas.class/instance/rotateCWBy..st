private-tranforms
rotateCWBy: degrees
	"Rotate my contents clockwise by the given angle in degrees."

	palette showRotationCenter: false.
	self prepareToTransform.
	transformSrcForm ifNil: [^ self].
	self saveTransformForUndo.
	transformDegrees := transformDegrees + degrees.
	self applyTransform.
