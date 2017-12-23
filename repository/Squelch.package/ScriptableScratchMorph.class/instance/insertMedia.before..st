media
insertMedia: aScratchMedia before: targetOrNil
	"Shuffle my media list so that the given media item comes immediately before the target media item, or at the end of the list if targetScratchMedia is nil. Do nothing if the given item is the same as the target item."

	| mediaItem |
	aScratchMedia == targetOrNil ifTrue: [^ self].

	mediaItem := aScratchMedia.
	(media includes: aScratchMedia) ifFalse: [
		"dropping an undeleted media item"
		mediaItem := mediaItem copy.
		mediaItem mediaName: (self unusedMediaNameFromBaseName: mediaItem mediaName).
		media addLast: mediaItem].

	media remove: mediaItem.
	targetOrNil
		ifNil: [media addLast: mediaItem]
		ifNotNil: [media add: mediaItem before: targetOrNil].
	self updateMediaCategory.
