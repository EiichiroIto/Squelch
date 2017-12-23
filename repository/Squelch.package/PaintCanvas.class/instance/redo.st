button actions
redo

	palette mode = #text ifTrue: [^ self beep].

	palette showRotationCenter ifTrue: [^ self redoRegPointMove].
	transformSrcForm ifNotNil: [^ self redoTransform].

	undoIndex > 1 ifFalse: [^ self beep].  "nothing more to redo"
	undoIndex := undoIndex - 1.
	canvasForm := undoList at: undoIndex.
	self clearMoveState.
	self changed.
