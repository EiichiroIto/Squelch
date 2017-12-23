private
rotationDegrees: newRotationDegrees scalePoint: newScalePoint

	((newRotationDegrees ~= rotationDegrees) or:
	 [scalePoint ~= newScalePoint]) ifTrue: [
		rotationDegrees := newRotationDegrees asFloat \\ 360.0.
		scalePoint := newScalePoint.
		self costumeChanged].
