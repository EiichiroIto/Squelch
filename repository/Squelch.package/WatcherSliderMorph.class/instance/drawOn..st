drawing
drawOn: aCanvas
	"Draw my normalLeft/normalEdge/normalRight forms and extend the normalEdgeForm to the width of my bounds."

	| formLeft formEdge formRight startPoint p clipC lastX |
	formLeft := forms at: 1.
	formEdge := forms at: 2.
	formRight := forms at: 3.

	startPoint := self bounds origin + (formLeft width@0).
	p := startPoint.
	clipC := aCanvas copyClipRect: self bounds.
	lastX := self bounds right - (formRight width) - 1.

	clipC translucentImage: formLeft at: self bounds origin.
	[p x <= lastX] whileTrue: [
		clipC translucentImage: formEdge at: p.
		p := (p x + formEdge width) @ p y].
	clipC translucentImage: formRight at: p.
