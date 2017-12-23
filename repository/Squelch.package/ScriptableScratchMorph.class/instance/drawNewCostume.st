media
drawNewCostume

	| oldCostumeName newName newImage |
	oldCostumeName := costume mediaName.
	newImage := ImageMedia new form: (Form extent: 4@4 depth: 8).
	newName := (self unusedMediaNameFromBaseName: self defaultImageMedia mediaName).
 	newImage mediaName: newName.
	media addLast: newImage.
	self lookLike: newImage mediaName.
	self updateMediaCategory.
	self editDrawingOldCostumeName: oldCostumeName deleteOnCancel: false.
