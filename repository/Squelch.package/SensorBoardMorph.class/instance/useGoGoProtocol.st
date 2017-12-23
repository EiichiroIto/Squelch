serial port
useGoGoProtocol

	self stopReadingData.
	useGoGoProtocol := true.
	scratchBoardV3 := false.
	self startReadingData.
