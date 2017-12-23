scratch ops
totalSeconds

	originalSound
		ifNil: [^ 0]
		ifNotNil: [^ originalSound samples size asFloat / originalSound originalSamplingRate].
