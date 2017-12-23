event handling
selectRectangleStartingAt: aPoint
	"Set selectionRect to a rectangular area starting at the given canvas point."

	| p |
	selectionRect := aPoint extent: 0@0.
	showSelection := true.
	World activeHand showTemporaryCursor: nil.
	Cursor crossHair showWhile: [
		[Sensor anyButtonPressed] whileTrue: [
			p := Sensor cursorPoint.
			self autoScroll: p.
			self canvasChanged: selectionRect.
			selectionRect := aPoint rectangle: (self screenToCanvas: p).
			selectionRect := selectionRect intersect: canvasForm boundingBox.
			self canvasChanged: selectionRect.
			World displayWorld]].
	showSelection := false.
	self changed.
	World displayWorld.

	selectionRect area = 0 ifTrue: [selectionRect := nil].
	^ selectionRect
