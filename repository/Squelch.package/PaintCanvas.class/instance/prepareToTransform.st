private-tranforms
prepareToTransform

	| f r |
	transformSrcForm ifNotNil: [^ self].

	(selectionRect isNil or: [palette mode ~= #move]) ifTrue: [
		self selectAll.
		selectionRect ifNil: [^ self]].  "empty canvas; do nothing".

	self startMove.

	f := moveOrStampForm.
	r := f rectangleEnclosingPixelsNotOfColor: Color transparent.
	(r width > 0) & (r height > 0) ifFalse: [transformSrcForm := nil. ^ self].

	transformSrcForm := moveOrStampForm := f copy: r.
	selectionRect := (selectionRect origin + r origin) extent: moveOrStampForm extent.

	transformScale := 1.0.
	transformDegrees := 0.
	transformHFlip := false.
	transformVFlip := false.
	transformUndoList := nil.  "clear undo list"
