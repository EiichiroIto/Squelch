drawing
drawFrameOn: aCanvas

	super drawFrameOn: aCanvas.
	self drawDividerOn: aCanvas.

	"draw middle bar left and right joints"
	aCanvas
		translucentImage: leftJointForm
		at: self topLeft + (leftMargin@(topSectionHeight-4)).
	aCanvas
		translucentImage: rightJointForm
		at: (self right - rightJointForm width - rightMargin) @ (self top + topSectionHeight - 4).
