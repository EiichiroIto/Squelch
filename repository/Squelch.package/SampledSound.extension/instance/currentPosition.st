*Squelch
currentPosition
	"Answer the current position of the playback head in seconds since the start of this sound (at the original sampling)."

	| sampleIndex |
	sampleIndex := indexHighBits + (scaledIndex >> IncrementFractionBits).
	^ sampleIndex asFloat / originalSamplingRate