event handling
dragShapeTo: aPoint
	"Draw or drag out a line or shape from the starting point to the given point. Called repeatedly while dragging. All points are in canvas coordinates."

	| mode w shapeCanvas endPoint r dx dy side |
	mode := palette mode.

	w := palette brushSize.
	feedbackForm bits atAllPut: 0.  "fast clear"
	shapeCanvas := FormCanvas on: feedbackForm.

	#line = mode ifTrue:[
		endPoint := aPoint.
		Sensor shiftPressed ifTrue: [
			(endPoint y - startPoint y) abs > (endPoint x - startPoint x) abs
				ifTrue: [endPoint := startPoint x@endPoint y]
				ifFalse: [endPoint := endPoint x@startPoint y]].
		shapeCanvas line: startPoint to: endPoint width: w color: Color black].

	#oval = mode ifTrue: [
		r := startPoint rectangle: aPoint.
		Sensor shiftPressed ifTrue: [
			dx := aPoint x - startPoint x.
			dy := aPoint y - startPoint y.
			side := dx abs max: dy abs.
			r := startPoint rectangle: startPoint + (side * (dx sign@dy sign))].
		palette shapeFilling
			ifTrue: [shapeCanvas fillOval: r color: Color black]
			ifFalse: [shapeCanvas frameOval: r width: w color: Color black]].

	#rect = mode ifTrue:[
		r := startPoint rectangle: aPoint.
		Sensor shiftPressed ifTrue: [
			dx := aPoint x - startPoint x.
			dy := aPoint y - startPoint y.
			side := dx abs max: dy abs.
			r := startPoint rectangle: startPoint + (side * (dx sign@dy sign))].
		palette shapeFilling
			ifTrue: [shapeCanvas fillRectangle: r color: Color black]
			ifFalse: [shapeCanvas frameRectangle: r width: w color: Color black]].

	lastPoint := aPoint.
	self changed.
