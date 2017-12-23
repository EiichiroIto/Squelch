private
nudge: aPoint

	selectionRect ifNotNil: [
		self canvasChanged: selectionRect.
		selectionRect := selectionRect translateBy: aPoint.
		self canvasChanged: selectionRect].
	