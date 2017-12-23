serial port
closePort

	port ifNotNil: [
		port flushInputBuffer.
		port close].

	port := nil.
	currentState := #idle.
	sensorValues atAllPut: 0.
	scratchBoardV3 := false.
	1 to: 8 do: [:i | (readouts at: i) contents: '0'].
	scanState := #off.
	self step.
