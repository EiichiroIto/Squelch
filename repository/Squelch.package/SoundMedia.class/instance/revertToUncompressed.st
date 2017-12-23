compressing
revertToUncompressed
	"Revert to my original, uncompressed sound after compression with the 'saveOriginal' flag."

	savedSound ifNotNil: [
		originalSound := savedSound.
		compressedSampleRate := nil.
		compressedBitsPerSample := nil.
		compressedData := nil.
		savedSound := nil].
