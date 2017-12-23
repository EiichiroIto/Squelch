compressing
shareSoundWith: aSoundMedia
	"Share my sound and compressed sound with the given SoundMedia."

	self sound: aSoundMedia sound.
	compressedSampleRate := aSoundMedia compressedSampleRate.
	compressedBitsPerSample := aSoundMedia compressedBitsPerSample.
	compressedData := aSoundMedia compressedData.
	savedSound := aSoundMedia savedSound.
