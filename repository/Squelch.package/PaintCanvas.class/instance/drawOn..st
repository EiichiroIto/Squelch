drawing
drawOn: aCanvas

	| damageRect srcRect dstRect |
	(bufferForm notNil and: [bufferForm extent = self extent]) ifFalse: [
		bufferForm := Form extent: self extent depth: 32].

	damageRect := bounds intersect: aCanvas clipRect.
	srcRect := (self screenToCanvas: damageRect origin)
		extent: ((damageRect extent / scale) truncated + 1).
	dstRect := 0@0 extent: srcRect extent * scale.

	"draw the checkboard background onto the buffer"
	self drawBGOnBufferSrcRect: srcRect dstRect: dstRect.

	"draw the paint layer onto the buffer"
	(WarpBlt toForm: bufferForm)
		sourceForm: canvasForm;
		colorMap: (canvasForm colormapIfNeededForDepth: 32);
		cellSize: 1;
		combinationRule: Form paint;
		copyQuad: srcRect innerCorners toRect: dstRect.

	"draw text, move/stamp, and feedback layers onto the buffer"
	self drawTextOnBufferSrcRect: srcRect dstRect: dstRect.
	moveOrStampForm ifNotNil: [self drawMoveOrStampFormSrcRect: srcRect dstRect: dstRect].
	selectionRect notNil ifTrue: [self drawSelectionOnBufferSrcRect: srcRect dstRect: dstRect].
	feedbackForm ifNotNil: [self drawFeedbackOnBufferSrcRect: srcRect dstRect: dstRect].

	(palette notNil and: [palette showRotationCenter]) ifTrue: [
		self drawRegistrationPointOnBufferSrcRect: srcRect dstRect: dstRect].

	"draw the buffer onto the canvas"
	(aCanvas copyClipRect: bounds)
		image: bufferForm
		at: (self canvasToScreen: srcRect origin)
		sourceRect: (0@0 extent: dstRect extent)
		rule: Form paint.
