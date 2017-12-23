media
duplicateMedia: itemToDuplicate
	"Duplicate the given media item."

	| dup |
	itemToDuplicate isSound ifTrue: [itemToDuplicate pausePlaying].
	dup := itemToDuplicate copy.
	dup mediaName: (self unusedMediaNameFromBaseName: itemToDuplicate mediaName).
	media addLast: dup.
	self updateMediaCategory.
