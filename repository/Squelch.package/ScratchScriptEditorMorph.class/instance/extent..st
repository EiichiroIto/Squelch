geometry
extent: aPoint

	super extent: aPoint.
	pageViewerMorph ifNotNil: [
		pageViewerMorph extent: self extent - (pageViewerMorph position - self position)].
