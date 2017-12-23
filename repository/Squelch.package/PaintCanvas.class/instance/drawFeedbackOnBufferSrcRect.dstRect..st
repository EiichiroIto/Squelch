drawing
drawFeedbackOnBufferSrcRect: srcRect dstRect: dstRect
	"Draw my shape-drawing feedback scaled onto my buffer form with the given source and destination rectangles."

	| cm tempForm |
	palette color1 isTransparent ifFalse: [  "normal case: drawing with a color"
		cm := Bitmap new: 2.
		cm at: 1 put: 0.  "transparent"
		cm at: 2 put: (palette color1 pixelValueForDepth: 32).
		(WarpBlt toForm: bufferForm)
			sourceForm: feedbackForm;
			colorMap: cm;
			cellSize: 1;
			combinationRule: Form paint;
			copyQuad: srcRect innerCorners toRect: dstRect.
		^ self].

	"special case: drawing with transparent"
	tempForm := Form extent: bufferForm extent depth: 32.
	cm := Bitmap new: 2.
	cm at: 1 put: 0.  "transparent"
	cm at: 2 put: 16rFFFFFFFF.
	(WarpBlt toForm: tempForm)
		sourceForm: feedbackForm;
		colorMap: cm;
		cellSize: 1;
		combinationRule: Form paint;
		copyQuad: srcRect innerCorners toRect: dstRect.

	cm := Bitmap
		with: ((Color gray: 0.9) pixelValueForDepth: 32)
		with: (Color white pixelValueForDepth: 32).
	(WarpBlt toForm: tempForm)
		sourceForm: bgForm;
		colorMap: cm;
		cellSize: 1;
		combinationRule: Form and;
		copyQuad: srcRect innerCorners toRect: dstRect.

	(BitBlt toForm: bufferForm)
		sourceForm: tempForm;
		destRect: dstRect;
		combinationRule: Form paint;
		copyBits.
