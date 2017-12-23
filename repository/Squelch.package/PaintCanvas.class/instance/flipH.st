button actions
flipH

	palette showRotationCenter: false.
	self prepareToTransform.
	transformSrcForm ifNil: [^ self].
	self saveTransformForUndo.
	transformHFlip := transformHFlip not.
	self applyTransform.
