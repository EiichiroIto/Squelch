button actions
rotateCCW

	Sensor shiftPressed ifTrue: [^ self rotate: false].
	self rotateCWBy: -30.
