right button menu
editDrawingOldCostumeName: oldCostumeName deleteOnCancel: aBoolean
	"Edit my original form with the paint editor."

	| sFrame paintEditor |
	costume isMovie ifTrue: [^ self beep].
	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph)
		ifNotNil: [
			sFrame paintingInProgress ifTrue: [^ self beep].
			sFrame stopAll.
			sFrame paintingInProgress: true].

	paintEditor := PaintFrame new.
	paintEditor
		withStartingObject: self;
		scratchFrame: sFrame;
		oldCostumeName: oldCostumeName deleteOnCancel: aBoolean.

	oldCostumeName ifNotNil: [
		"When an oldCostumeName is supplied, it means I'm making a new drawing. Clear the initial rotation center."
		paintEditor clearRotationCenter].

	(paintEditor isKindOf: DialogBoxMorph)
		ifTrue: [paintEditor getUserResponse]
		ifFalse: [
			World addMorphFront: paintEditor.
			World startSteppingSubmorphsOf: paintEditor].
