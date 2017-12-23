private
commentsAfterMe: blocksInStack
	"Return a collection of comment morphs in my owner that are attached to blocks after me in the given list of blocks. Assumes anchor is not nil."

	| result allComments |
	owner ifNil: [^ #()].
	allComments := owner submorphs select: [:m |
		m isKindOf: self class].

	result := OrderedCollection new.
	blocksInStack reversed do: [:b |
		b == anchor ifTrue: [^ result asArray].
		allComments do: [:c | c anchor = b ifTrue: [result add: c]]].

	^ result asArray

