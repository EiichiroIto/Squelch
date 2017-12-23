accessing
mediaSizeInKilobytes
	"Returns the storage size of this sound in kilobytes, rounded to the nearest kilobyte."

	| bytes |
	bytes := 0.
	compressedData
		ifNil: [
			(originalSound isKindOf: MixedSound)
				ifTrue: [
					originalSound sounds do: [:snd |
						bytes := bytes + (2 * snd samples monoSampleCount)]]
				ifFalse: [
					bytes := 2 * originalSound samples monoSampleCount]]
		ifNotNil: [bytes := compressedData size].

	^ (bytes + 512) // 1024
