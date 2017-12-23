button actions
eraseAll

	palette showRotationCenter: false.
	palette mode = #stamp ifFalse: [self clearMoveState].
	self clearRegistrationPoint.
	self saveForUndo.
	canvasForm := Form extent: self extent depth: 32.
	self changed.
