drawing
drawMoveOrStampFormSrcRect: srcRect dstRect: dstRect
	"Draw the Form being moved or stamped on the bufferForm at the given point."

	| r |
	(moveOrStampForm isNil | selectionRect isNil) ifTrue: [^ self].
	((palette mode = #stamp) and: [(bounds containsPoint: Sensor cursorPoint) not]) ifTrue: [^ self].

	r := (selectionRect origin - srcRect origin extent: moveOrStampForm extent) scaleBy: scale.
	(WarpBlt toForm: bufferForm)
		sourceForm: moveOrStampForm;
		colorMap: (moveOrStampForm colormapIfNeededForDepth: 32);
		cellSize: 1;
		combinationRule: Form paint;
		copyQuad: moveOrStampForm boundingBox innerCorners toRect: r.

