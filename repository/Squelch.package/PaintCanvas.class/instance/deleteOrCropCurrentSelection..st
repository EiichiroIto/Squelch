private
deleteOrCropCurrentSelection: evt

	| r selForm |
	selectionRect ifNil: [^ self].  "no selection"
	moveOrStampForm ifNotNil: [
		r := selectionRect.
		self commitMove.
		selectionRect := r].
	self saveForUndo.
	evt shiftPressed
		ifTrue: [  "crop everything outside of the selection rectangle"
			selForm := canvasForm copy: selectionRect.
			canvasForm fillColor: Color transparent.
			selForm displayOn: canvasForm at: selectionRect origin rule: Form over]
		ifFalse: [  "delete current selection"
			canvasForm fill: selectionRect fillColor: Color transparent].
	selectionRect := moveOrStampForm := nil.
	self changed.
