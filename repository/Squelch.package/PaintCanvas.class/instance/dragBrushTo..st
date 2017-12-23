event handling
dragBrushTo: aPoint
	"While painting or erasing, move the brush to the given point. Called repeatedly while dragging. All points are in canvas coordinates."

	| p |
	p := (aPoint max: scrollX@scrollY) min: (scrollX@scrollY) + (bounds extent // scale).
	brush goto: p.
	self canvasChanged: ((lastPoint rectangle: p) expandBy: (brush sourceForm width / 2.0) ceiling).
	lastPoint := p.
