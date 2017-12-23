drawing
drawSelectionOnBufferSrcRect: srcRect dstRect: dstRect
	"Draw the selection rectangle."

	| bitBlt r |
	(showSelection or: [palette mode = #move]) ifFalse: [^ self].
 
	bitBlt := (BitBlt toForm: bufferForm)
		clipRect: dstRect;
		fillColor: ((Bitmap new: 1) at: 1 put: 16777214; yourself);
		combinationRule: Form reverse.

	r := ((selectionRect translateBy: srcRect topLeft negated) scaleBy: scale) rounded translateBy: dstRect topLeft.
	bitBlt destRect: (r topLeft extent: r width@1); copyBits.
	bitBlt destRect: (r topLeft + (0@1) extent: 1@(r height - 1)); copyBits.
	bitBlt destRect: (r topRight + (-1@1) extent: 1@(r height - 1)); copyBits.
	bitBlt destRect: (r bottomLeft + (1@ -1) extent: (r width - 2)@1); copyBits.
