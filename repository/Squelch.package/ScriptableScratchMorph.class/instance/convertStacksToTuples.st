blocks
convertStacksToTuples
	"Convert my blocks bin from a morph containing block stack into a collection of (<point>, <tuple>) pairs the represent the same stacks in compact, language-independent form."

	| stacks blocks comments |

	(blocksBin isKindOf: Array) ifTrue: [^ self].  "already converted"

	stacks := (blocksBin submorphs select: [:m | m respondsTo: #tupleSequence]).
	blocks := stacks select: [:m | m isKindOf: BlockMorph].
	comments := stacks select: [:m | m isKindOf: ScratchCommentMorph].

	blocks := blocks collect: [:blockM |
		Array
			with: blockM position - blocksBin position
			with: blockM tupleSequence].

	comments := comments collect: [:blockM |
		Array
			with: blockM position - blocksBin position
			with: blockM tupleSequence].

	blocksBin := blocks, comments.
