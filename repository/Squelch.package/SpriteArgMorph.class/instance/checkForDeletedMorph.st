other
checkForDeletedMorph
	"If I refer to a Sprite that has been deleted, nil out my morph field. Do nothing if my morph is a ScratchStageMorph"

	(morph isKindOf: Morph) ifFalse: [^ self].
	morph owner ifNotNil: [^ self].

	(morph isKindOf: ScratchStageMorph) ifTrue: [^ self].

	morph := nil.  "nil out reference to deleted sprite"

