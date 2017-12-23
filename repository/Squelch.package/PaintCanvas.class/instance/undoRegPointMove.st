registration point
undoRegPointMove

	regPointUndoList ifNil: [^ self beep].  "no undo entries yet"
	regPointUndoIndex >= regPointUndoList size ifTrue: [^ self beep].  "nothing more to undo"
	regPointUndoIndex = 0 ifTrue: [
		self saveRegPointForUndo.
		regPointUndoIndex := 1].

	regPointUndoIndex := regPointUndoIndex + 1.
	registrationPoint := regPointUndoList at: regPointUndoIndex.
	self changed.
