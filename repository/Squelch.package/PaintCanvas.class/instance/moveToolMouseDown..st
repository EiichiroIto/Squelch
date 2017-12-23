private-move tool
moveToolMouseDown: aPoint
	"Mouse up with move tool selected."

	(selectionRect notNil and:
	 [(selectionRect containsPoint: aPoint) not]) ifTrue: [
		"click outside current selection; select again"
		self commitMove.
		selectionRect := nil.
		self changed.
		World displayWorldSafely].  "force redraw to remove old selection"

	selectionRect ifNil: [  "choose a selection rectangle"
		selectionRect := self selectRectangleStartingAt: aPoint.
		moveOrStampForm := nil.
		^ self changed].

	self startMove.

	dragOffset := aPoint - selectionRect origin.
	World activeHand showTemporaryCursor: Cursor handClosed.
	self changed.
