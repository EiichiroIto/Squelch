drawing
showDeleteFeedback
	"Display feedback for the scissors tool."

	| h cutBlock r |
	h := World activeHand.
	(cutBlock := self topBlockMorphAt: h cursorPoint exclude: nil) ifNil: [^ self].
	r := cutBlock bounds.
	((cutBlock isKindOf: CBlockMorph) and: [cutBlock firstBlockList size > 0])
		ifTrue: [r := r merge: cutBlock firstBlockList first fullBounds].
	(cutBlock isKindOf: HatBlockMorph)
		ifTrue: [r := cutBlock fullBounds].
	feedbackMorph
		bounds: (r expandBy: 3);
		color: Color transparent;
		borderColor: (Color r: 212/255 g: 40/255 b: 40/255).
	self addMorphFront: feedbackMorph.
