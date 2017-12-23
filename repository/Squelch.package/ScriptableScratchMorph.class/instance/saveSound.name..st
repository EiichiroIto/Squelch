media
saveSound: aSampledSound name: baseName

	| sndItem |
	sndItem := SoundMedia new.
	sndItem mediaName: (self unusedMediaNameFromBaseName: baseName).
	media addLast: sndItem.

	sndItem sound: aSampledSound.
	self updateMediaCategory.
