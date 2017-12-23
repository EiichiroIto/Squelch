geometry
extent: aPoint

	bounds extent = aPoint ifFalse: [
		bounds := bounds topLeft extent: aPoint.
		self layoutChanged.
		self changed].
