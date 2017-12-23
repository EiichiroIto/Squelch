registration point
saveRegPointForUndo
	"Save the current registration point to allow undoing." 

	regPointUndoList ifNil: [  "create registration point undo list"
		regPointUndoList := OrderedCollection new.
		regPointUndoIndex := 0].

	registrationPoint ifNotNil: [
		regPointUndoList addFirst: registrationPoint.
		regPointUndoIndex := 0].
