geometry
extent: aPoint

	super extent: aPoint.
	pageViewer ifNotNil: [pageViewer extent: self extent - (pageViewer position - self position)].
