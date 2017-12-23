initialization
initialize

	super initialize.
	sensorValues := Array new: 16 withAll: 0.
	currentState := #idle.
	highByte := 0.
	useGoGoProtocol ifNil: [useGoGoProtocol := false].
	scratchBoardV3 := false.
	reportRaw := false.
	scanState := #off.
	self addReadouts.
