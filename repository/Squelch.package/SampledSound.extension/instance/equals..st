*Squelch
equals: aSampledSound
	"Answer true if the receiver is exactly the same as the given SampledSound."

	self == aSampledSound ifTrue: [^ true].

	self class = aSampledSound class ifFalse: [^ false].
	(originalSamplingRate = aSampledSound originalSamplingRate) ifFalse: [^ false].

	^ samples = aSampledSound samples