button actions
rotateCW

	Sensor shiftPressed ifTrue: [^ self rotate: true].
	self rotateCWBy: 30.
