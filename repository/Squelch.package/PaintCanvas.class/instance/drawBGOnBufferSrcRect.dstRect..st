drawing
drawBGOnBufferSrcRect: srcRect dstRect: dstRect
	"Draw a checkboard background pattern onto my buffer form with the given source and destination rectangles."

	| cm |
	(bgForm isNil or: [bgForm extent ~= canvasForm extent])
		ifTrue: [bgForm := self makeCheckerboard].

	cm := Bitmap
		with: ((Color gray: 0.9) pixelValueForDepth: 32)
		with: ((Color gray: 0.99) pixelValueForDepth: 32).
	(WarpBlt toForm: bufferForm)
		sourceForm: bgForm;
		colorMap: cm;
		cellSize: 1;
		combinationRule: Form paint;
		copyQuad: srcRect innerCorners toRect: dstRect.
