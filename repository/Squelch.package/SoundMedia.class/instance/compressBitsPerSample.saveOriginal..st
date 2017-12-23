compressing
compressBitsPerSample: bits saveOriginal: saveFlag
	"Compress my sound if possible. Return true if compression is done."

	| samples |
	self isBuiltInSound ifTrue: [^ false].  "don't compress built-in sounds"
	compressedData ifNotNil: [^ false].  "don't recompress"
	((originalSound isKindOf: SampledSound) not or:
	 [originalSound isStereo]) ifTrue: [^ false].

	saveFlag
		ifTrue: [savedSound := originalSound]
		ifFalse: [savedSound := nil].

	samples := originalSound samples.
	compressedSampleRate := originalSound originalSamplingRate.
	[compressedSampleRate >= 32000] whileTrue: [
		samples := samples downSampledLowPassFiltering: false.
		compressedSampleRate := compressedSampleRate // 2].

	compressedBitsPerSample := bits.
	compressedData := (ADPCMCodec newBitsPerSample: bits) encodeSoundBuffer: samples.

	^ true

