compressing
decompress
	"Decompress sound from compressed data so result of compression can be heard. Do nothing if sound is not compressed."

	| samples |
	compressedData ifNil: [^ self].

	samples := (ADPCMCodec newBitsPerSample: compressedBitsPerSample)
		decodeCompressedData: compressedData.
	originalSound := SampledSound
		samples: samples
		samplingRate: compressedSampleRate.

