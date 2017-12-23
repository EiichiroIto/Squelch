button actions
flipV

	palette showRotationCenter: false.
	self prepareToTransform.
	transformSrcForm ifNil: [^ self].
	self saveTransformForUndo.
	transformVFlip := transformVFlip not.
	self applyTransform.
