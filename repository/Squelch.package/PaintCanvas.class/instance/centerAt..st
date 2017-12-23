private
centerAt: aPoint
	"Center the viewable area on the given point in the canvasForm--or as close as possible at the current scale."

	| limits |
	limits := (canvasForm extent - (self extent // scale)) max: (0@0).
	scrollX := (aPoint x - (self width // (2 * scale))) min: limits x max: 0.
	scrollY := (aPoint y - (self height // (2 * scale))) min: limits y max: 0.
	(self owner respondsTo: #updateScrollbars) ifTrue: [self owner updateScrollbars].
	self changed.

