private
selectAll
	"Select all non-transparent pixels and switch to move mode."

	| r |
	self commitMove.
	r := canvasForm rectangleEnclosingPixelsNotOfColor: Color transparent.
	r area = 0 ifTrue: [^ self].
	selectionRect := r.
	palette mode: #move.
	self changed.
