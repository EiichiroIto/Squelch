translation support
blockSpecsStringForTranslation
	"Answer a String that lists all the blocks and categories to be used as a guide to block translation."

	| out blocks pairs key |
	out := WriteStream on: (String new: 10000).
	ScratchSpriteMorph new blockCategories sort collect: [:cat |
		out nextPutAll: '-	', cat; cr.
		blocks :=  (ScratchSpriteMorph new blocksFor: cat)
			select: [:b | b isKindOf: CommandBlockMorph].
		pairs := blocks collect: [:b |
			key := b selector collect: [:ch | ch = $: ifTrue: [$_] ifFalse: [ch]].
			Array with: key with: b commandSpec].
		pairs sort: [:p1 :p2 | p1 first < p2 first].
		pairs do: [:p | out nextPutAll: p first; tab; nextPutAll: p last; cr]].
	^ out contents
