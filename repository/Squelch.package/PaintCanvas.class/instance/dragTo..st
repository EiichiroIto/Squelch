event handling
dragTo: aPoint
	"Drag to the given point with the current drawing tool. The point is in canvas coordinates."

	| mode c |
	mode := palette mode.
	((#paint = mode) | (#erase = mode)) ifTrue: [^ self dragBrushTo: aPoint].
	(#(line oval rect) includes: mode) ifTrue: [^ self dragShapeTo: aPoint].

	#eyedropper = mode ifTrue: [
		(bounds containsPoint: Sensor cursorPoint)
			ifTrue: [c := canvasForm colorNoAlphaAt: aPoint]  "if over me, get color from canvasForm"
			ifFalse: [c := Display colorAt: Sensor cursorPoint].
		palette color1: c.
		^ self].

	"holding shift with the stamp tool does multiple stamps while dragging"
	((#stamp = palette mode) & (Sensor shiftPressed)) ifTrue: [
		self stampAt: aPoint.
		Delay waitMSecs: 50.
		^ self].
