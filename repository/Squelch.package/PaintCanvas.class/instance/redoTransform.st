private-tranforms
redoTransform

	| rec |
	transformUndoList ifNil: [^ self beep].  "no undo entries yet"
	transformUndoIndex < 2 ifTrue: [^ self beep].  "nothing more to redo"
	transformUndoIndex := transformUndoIndex - 1.

	rec := transformUndoList at: transformUndoIndex.
	transformScale := rec at: 1.
	transformDegrees := rec at: 2.
	transformHFlip := rec at: 3.
	transformVFlip := rec at: 4.
	selectionRect := Rectangle center: (rec at: 5) extent: selectionRect extent.
	self applyTransform.
