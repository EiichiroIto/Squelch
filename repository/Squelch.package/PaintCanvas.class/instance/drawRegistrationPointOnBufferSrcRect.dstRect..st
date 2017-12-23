drawing
drawRegistrationPointOnBufferSrcRect: srcRect dstRect: dstRect
	"Draw the registation point."

	| r offset bitBlt x y |
	registrationPoint ifNil: [  "compute an initial registration point"
		r := canvasForm rectangleEnclosingPixelsNotOfColor: Color transparent.
		r area = 0
			ifTrue: [registrationPoint := canvasForm center]
			ifFalse: [registrationPoint := r center]].
	registrationPoint := (registrationPoint max: 0@0) min: canvasForm extent.

	offset := scale > 1 ifTrue: [scale // 2] ifFalse: [0].

	bitBlt := (BitBlt toForm: bufferForm)
		clipRect: dstRect;
		fillColor: ((Bitmap new: 1) at: 1 put: 16777214; yourself);
		combinationRule: Form reverse.

	(registrationPoint x between: srcRect left and: srcRect right) ifTrue: [
		x := dstRect left + (scale * (registrationPoint x - srcRect left)) rounded + offset.
		bitBlt
			destRect: (x@0 extent: 1@bufferForm height);
			copyBits].
	(registrationPoint y between: srcRect top and: srcRect bottom) ifTrue: [
		y := dstRect top + (scale * (registrationPoint y - srcRect top)) rounded + offset..
		bitBlt
			destRect: (0@y extent: bufferForm width@1);
			copyBits].
