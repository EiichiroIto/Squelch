fixed format-reading
getSoundBuf: anObject id: classID

	| sampleCount result |
	sampleCount := stream uint32.
	result := SoundBuffer newMonoSampleCount: sampleCount.
	(stream isKindOf: FileStream)
		ifTrue: [
			stream next: (sampleCount // 2) into: result startingAt: 1.  "size is in 32-bit words"
			Smalltalk isBigEndian ifFalse: [result reverseEndiannessStereo: false]]
		ifFalse: [
			1 to: sampleCount do: [:i | result at: i put: stream int16]].

	^ result
