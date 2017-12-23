private-tranforms
undoTransform

	| rec |
	transformUndoList ifNil: [^ self beep].  "no undo entries yet"
	transformUndoIndex >= transformUndoList size ifTrue: [^ self beep].  "nothing more to undo"
	transformUndoIndex = 0 ifTrue: [
		self saveTransformForUndo.
		transformUndoIndex := 1].

	transformUndoIndex := transformUndoIndex + 1.
	rec := transformUndoList at: transformUndoIndex.
	transformScale := rec at: 1.
	transformDegrees := rec at: 2.
	transformHFlip := rec at: 3.
	transformVFlip := rec at: 4.
	selectionRect := Rectangle center: (rec at: 5) extent: selectionRect extent.
	self applyTransform.
