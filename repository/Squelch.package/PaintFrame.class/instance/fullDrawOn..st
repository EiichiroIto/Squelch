drawing
fullDrawOn: aCanvas
	"Optimization. Don't draw myself if damage is only within the paint canvas."

	self visible ifFalse: [^ self].
	(self hasProperty: #errorOnDraw) ifTrue:[^ self drawErrorOn: aCanvas].
	(canvasMorph bounds containsRect: aCanvas clipRect)
		ifFalse: [aCanvas drawMorph: self].
	self drawSubmorphsOn:aCanvas.
