private-move tool
commitMove
	"Commit the last move operation, if any."

	(moveOrStampForm isNil | selectionRect isNil) ifTrue: [^ self].

	palette mode = #move ifTrue: [
		moveOrStampForm
			displayOn: canvasForm
			at: selectionRect origin
			rule: Form paint.
		self changed].

	self clearMoveState.

