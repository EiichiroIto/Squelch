event handling
extent: aPoint

	super extent: aPoint.
	contentsMorph ifNotNil: [self fixLayout].
