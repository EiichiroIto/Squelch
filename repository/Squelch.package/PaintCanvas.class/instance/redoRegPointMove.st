registration point
redoRegPointMove

	regPointUndoList ifNil: [^ self beep].  "no undo entries yet"
	regPointUndoIndex < 2 ifTrue: [^ self beep].  "nothing more to redo"
	regPointUndoIndex := regPointUndoIndex - 1.
	registrationPoint := regPointUndoList at: regPointUndoIndex.
	self changed.
