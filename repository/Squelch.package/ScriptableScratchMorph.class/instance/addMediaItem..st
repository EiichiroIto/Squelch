media
addMediaItem: aScratchMedia
	"Add the given media item to my media."

	aScratchMedia mediaName: (self unusedMediaNameFromBaseName: aScratchMedia mediaName).
	media addLast: aScratchMedia.
	aScratchMedia isSound ifFalse: [self lookLike: aScratchMedia mediaName].
	self updateMediaCategory.