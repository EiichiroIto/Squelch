private
saveForUndo
	"Record my current canvas Form for undo."
	"Note: The most recent canvas is added to the front of the undo list. If the undo list is already of maximum size, the oldest
entry is removed and, if possible, recycled."

	| f |
	undoIndex > 0 ifTrue: [undoList := undoList copyFrom: undoIndex + 1 to: undoList size].

	((undoList size >= MaxUndo) and:
	 [undoList last extent = canvasForm extent])
		ifTrue: [f := undoList removeLast. f unhibernate]
		ifFalse: [f := Form extent: canvasForm extent depth: canvasForm depth].

	"quickly copy current canvas contents; f must be same size & depth and unhibernated"
	canvasForm unhibernate.
	f bits replaceFrom: 1 to: f bits size with: canvasForm bits startingAt: 1.

	undoList addFirst: f.
	undoIndex := 0.
