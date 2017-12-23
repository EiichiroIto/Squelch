drawing
drawOn: aCanvas

	| f x y |
	super drawOn: aCanvas.
	y := self bottom - leftPointerForm height.
	pointLeft
		ifTrue: [f := leftPointerForm. x := self left + 7]
		ifFalse: [f := rightPointerForm. x := self right - 53].
	aCanvas paintImage: f at: (x@y) truncated.
