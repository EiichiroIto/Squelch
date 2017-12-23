entry points
withStartingObject: anObject
	"Start editing the given object's form (i.e. it's current costume, if it is a ScratchSpriteMorph)."

	| costume |
	originalObject := anObject.
	(anObject respondsTo: #costume)
		ifTrue: [  "editing a Scratch object"
			costume := anObject costume.
			canvasMorph
				editForm: costume form
				regPoint: costume rotationCenter
				textBox: costume textBox
				isStage: (anObject isKindOf: ScratchStageMorph)]
		ifFalse: [  "editing a non-Scratch object"
			canvasMorph editForm: anObject form].

	(anObject isKindOf: ScratchStageMorph)
		ifTrue: [self scaleCanvas: 1]
		ifFalse: [self scaleCanvas: 2].
	World activeHand newKeyboardFocus: canvasMorph.

