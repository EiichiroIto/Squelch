media
revertToCostume: oldCostumeName
	"Sent by the paint editor if editing of a newly-created costume is cancelled. Delete the new costume and revert to the old costume with the given name."

	| newlyCreatedCostume |
	newlyCreatedCostume := costume.
	self lookLike: oldCostumeName.
	media remove: newlyCreatedCostume ifAbsent: [].
	self updateMediaCategory.
