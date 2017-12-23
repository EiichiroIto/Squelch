compressing
reduceSamplingRate
	"Reduce my sampling rate to under 22 ksamples/sec (typically to 11.025 ksamples/sec). Answer true if the sampling rate was reduced."

	originalSound originalSamplingRate < 22000 ifTrue: [^ false].  "already reduced"
	self isBuiltInSound ifTrue: [^ false].  "built-in sound"

	self pausePlaying.
	playingSound := nil.

	[originalSound originalSamplingRate < 22000] whileFalse: [
		originalSound := SampledSound
			samples: (originalSound samples downSampledLowPassFiltering: true)
			samplingRate: originalSound originalSamplingRate // 2].

	^ true
