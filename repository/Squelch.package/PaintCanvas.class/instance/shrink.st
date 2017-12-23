button actions
shrink

	Sensor shiftPressed ifTrue: [^ self magnify].
	self scaleBy: (1.0 / EnlargeFactor).
