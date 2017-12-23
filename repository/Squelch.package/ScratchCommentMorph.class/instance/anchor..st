accessing
anchor: aBlock

	self detach.
	anchor := aBlock.
	aBlock topBlock commentLayoutChanged.
