private
commentsBeforeMe: blocksInStack
	"Return a collection of comment morphs in my owner that are attached to blocks before me in the given list of blocks. Assumes anchor is not nil."

	| allComments result |
	owner ifNil: [^ #()].
	allComments := owner submorphs select: [:m | m isKindOf: self class].

	result := OrderedCollection new.
	blocksInStack do: [:b |
		b == anchor ifTrue: [^ result asArray].
		allComments do: [:c | c anchor = b ifTrue: [result add: c]]].

	^ result asArray
