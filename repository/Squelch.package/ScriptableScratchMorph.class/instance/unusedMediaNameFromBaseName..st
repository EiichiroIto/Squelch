media
unusedMediaNameFromBaseName: baseName
	"Answer an unused name for a new media item with the given base name. Strip off the file extension, if any."

	^ self unusedMediaNameFromBaseName: baseName forMedia: nil