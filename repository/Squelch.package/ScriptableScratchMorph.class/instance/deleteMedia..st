media
deleteMedia: itemToDelete
	"Delete the given media item."

	| oldIndex costumesBefore costumesAfter newCostume |
	oldIndex := media indexOf: itemToDelete.
	media remove: itemToDelete ifAbsent: [].
	itemToDelete isSound ifTrue: [itemToDelete sound pause].

	itemToDelete == costume ifTrue: [
		"select the costume just before or after the costume being deleted"
		costumesBefore := (media copyFrom: 1 to: oldIndex - 1) select: [:item | item isSound not].
		costumesAfter := (media copyFrom: oldIndex to: media size) select: [:item | item isSound not].
		costumesBefore size > 0
			ifTrue: [newCostume := costumesBefore last]
			ifFalse: [
				costumesAfter size > 0
					ifTrue: [newCostume := costumesAfter first]
					ifFalse: [media addLast: (newCostume := itemToDelete)]].
		self lookLike: newCostume mediaName].

	self updateMediaCategory.
