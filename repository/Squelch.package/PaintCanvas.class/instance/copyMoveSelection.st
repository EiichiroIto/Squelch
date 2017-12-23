private
copyMoveSelection
	"If we've made a selection with the move tool but haven't yet picked it up, make a copy of the selection."

	| f r |
	((palette mode = #move) & selectionRect notNil) ifFalse: [^ self beep].

	moveOrStampForm
		ifNil: [moveOrStampForm := canvasForm copy: selectionRect]
		ifNotNil: [
			"commit current move, then copy bits"
			self saveForUndo.
			f := moveOrStampForm.
			r := selectionRect.
			self commitMove.
			moveOrStampForm := f.
			selectionRect := r].

	selectionRect := selectionRect translateBy: 5@5.
	self changed.