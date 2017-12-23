private-tranforms
scaleBy: scaleFactor
	"Scale my contents by the given factor."

	| maxScale |
	palette showRotationCenter: false.
	self prepareToTransform.
	transformSrcForm ifNil: [^ self].
	maxScale := 1000.0 / (transformSrcForm width max: transformSrcForm height).
	self saveTransformForUndo.
	transformScale := (transformScale * scaleFactor) min: maxScale.
	self applyTransform.
