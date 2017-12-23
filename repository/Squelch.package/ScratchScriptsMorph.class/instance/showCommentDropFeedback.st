stepping
showCommentDropFeedback

	| hand comment target r |

	hand := World activeHand.
	comment := hand firstSubmorph.
	target := comment attachTargetIn: self.
	target ifNil: [^ self].

	r := target bounds.

	((target isKindOf: CBlockMorph) and: [target firstBlockList size > 0])
		ifTrue: [r := r merge: target firstBlockList first fullBounds].
	(target isKindOf: IfElseBlockMorph)
		ifTrue: [
			(target trueBlockList size > 0)
				ifTrue: [r := r merge: target trueBlockList first fullBounds].
			(target falseBlockList size > 0)
				ifTrue: [r := r merge: target falseBlockList first fullBounds]].
	feedbackMorph
		bounds: (r expandBy: 3);
		color: Color transparent;
		borderColor: (comment topBarColor).
	self addMorphFront: feedbackMorph.
