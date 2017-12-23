private-move tool
startMove
	"Start a move operation if there is a selection rectangle and if a move operation is not already in progress. (A move is in progress if moveOrStampForm is not nil.) Copy the canvas bits within the selection rectangle and clear that part of the canvas."

	transformSrcForm ifNotNil: [self saveTransformForUndo].
	moveOrStampForm notNil | selectionRect isNil ifTrue: [^ self].

	self saveForUndo.
	moveOrStampForm := canvasForm copy: selectionRect.
	canvasForm fill: selectionRect fillColor: Color transparent.
