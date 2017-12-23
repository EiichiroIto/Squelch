private-tranforms
saveTransformForUndo
	"Save the current transform to allow undoing." 

	transformUndoList ifNil: [  "create transform undo list"
		transformUndoList := OrderedCollection new.
		transformUndoIndex := 0].

	transformUndoList addFirst: {
		transformScale.
		transformDegrees.
		transformHFlip.
		transformVFlip.
		selectionRect center}.

	transformUndoIndex := 0.
