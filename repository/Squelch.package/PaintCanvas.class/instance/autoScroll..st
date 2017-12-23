event handling
autoScroll: cursorPoint
	"Autoscroll towards the given point."

	| scrollDelta deltaX deltaY max |
	(bounds containsPoint: cursorPoint) ifTrue: [^ self].  "no scrolling needed"

	scrollDelta := 64 // scale.  "this controls autoscroll speed"

	cursorPoint x < bounds left ifTrue: [deltaX := scrollDelta negated].
	cursorPoint x > bounds right ifTrue: [deltaX := scrollDelta].
	cursorPoint y < bounds top ifTrue: [deltaY := scrollDelta negated].
	cursorPoint y > bounds bottom ifTrue: [deltaY := scrollDelta].

	deltaX ifNotNil: [
		max := canvasForm width - (self width // scale).
		scrollX := (scrollX + deltaX) rounded min: max max: 0].
	deltaY ifNotNil: [
		max := canvasForm height - (self height // scale).
		scrollY := (scrollY + deltaY) rounded min: max max: 0].

	(owner respondsTo: #updateScrollbars) ifTrue: [owner updateScrollbars].
	self changed.

