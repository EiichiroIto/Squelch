serial port
useScratchboardProtocol

	self stopReadingData.
	useGoGoProtocol := false.
	self startReadingData.
