private
updateAnchorOffset
	"Update the horizontal offset from my anchor block."

	| extraSpace blocksInStack rects allObstacles touching before after collapsed |

	anchor ifNil: [^ self].

	self resetAnchorOffset.
	isShowing ifFalse: [^ self].

	extraSpace := 5.
	blocksInStack := anchor topBlock allMorphs reversed select:
		[:m | (m isKindOf: BlockMorph) and: [m isReporter not]].
	before := self commentsBeforeMe: blocksInStack.
	after := self commentsAfterMe: blocksInStack.
	collapsed := after select: [:c | c isShowing not].

	before, collapsed do: [: c | c resetAnchorOffset].
	before do: [:c | c updateAnchorOffset].

	allObstacles := blocksInStack, before, collapsed.
	rects := allObstacles collect: [:m | (m isKindOf: BlockMorph)
		ifTrue: [m bounds origin extent: (m bounds extent - (0@4))]
		ifFalse: [m bounds]].

	[touching := rects detect: [:r | (r intersects: self bounds)] ifNone: [nil].
	 touching isNil] whileFalse: [
		ScratchTranslator isRTL
			ifTrue: [self right: (self right min: (touching left - extraSpace))]
			ifFalse: [self left: (self left max: (touching right + extraSpace))]].

	ScratchTranslator isRTL
		ifTrue: [anchorOffset := anchor left - self right]
		ifFalse: [anchorOffset := self left - anchor right].

	self updatePosition.
