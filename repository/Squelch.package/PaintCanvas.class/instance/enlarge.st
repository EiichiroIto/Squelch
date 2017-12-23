button actions
enlarge

	Sensor shiftPressed ifTrue: [^ self magnify].
	self scaleBy: EnlargeFactor.
