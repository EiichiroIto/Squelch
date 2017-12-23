private
newContents: aForm center: centerPoint
	"Replace the contents of my canvas with the new form after some transformation."

	| r f p |
	r := aForm rectangleEnclosingPixelsNotOfColor: Color transparent.
	r = aForm boundingBox
		ifTrue: [f := aForm]
		ifFalse: [f := aForm copy: r].

	"adjust canvasForm extent if necessary"
	((f width > canvasForm width) |
	 (f height > canvasForm height) |
	 ((f width < canvasForm width) & (canvasForm width > self width)) |
	 ((f height < canvasForm height) & (canvasForm height > self height))) ifTrue: [
		canvasForm := Form extent: (self extent max: f extent) depth: canvasForm depth].

	p := centerPoint - (f extent // 2).				"try to center"
	p := p min: canvasForm extent - f extent.		"but don't go off bottom or right"
	p := p max: 0@0.								"and don't go off the top or left"

	canvasForm fillColor: Color transparent.
	f displayOn: canvasForm at: p.

	self centerAt: (p + (f extent // 2)).

