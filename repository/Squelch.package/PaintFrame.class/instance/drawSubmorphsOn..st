drawing
drawSubmorphsOn: aCanvas
	"Optimization: If change is only within PaintCanvas, only redraw that."

	(canvasMorph bounds containsRect: aCanvas clipRect) ifTrue: [
		 aCanvas fullDrawMorph: canvasMorph.
		^ self].

	super drawSubmorphsOn: aCanvas.
