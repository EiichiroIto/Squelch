stepping
step

	self updateTitle.
	self updateBorder.
	self updateCountMorph.
	self updateIndexHighlight.
	listLayoutNeeded ifTrue: [self updateContents].
