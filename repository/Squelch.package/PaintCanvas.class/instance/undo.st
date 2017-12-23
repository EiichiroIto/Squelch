button actions
undo

	palette mode = #text ifTrue: [^ self beep].

	palette showRotationCenter ifTrue: [^ self undoRegPointMove].
	transformSrcForm ifNotNil: [^ self undoTransform].

	undoIndex >= undoList size ifTrue: [^ self beep].  "nothing more to undo"

	palette mode = #move ifTrue: [moveOrStampForm := selectionRect := nil].

	undoIndex = 0 ifTrue: [
		self saveForUndo.  "save the current canvas so we can redo"
		undoIndex := 1].

	undoIndex := undoIndex + 1.
	canvasForm := undoList at: undoIndex.
	self clearMoveState.
	self changed.
