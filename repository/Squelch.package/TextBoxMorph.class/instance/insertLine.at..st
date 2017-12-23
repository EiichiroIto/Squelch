operations
insertLine: aString at: lineIndex

	| lines n newContents |
	lines := contentsMorph contents lines asOrderedCollection.
	n := lineIndex truncated.
	n > lines size ifTrue: [n := lines size].
	n < 1 ifTrue: [n := 1].
	lines insert: aString before: n.

	newContents := WriteStream on: (String new: 1000).
	lines do: [:s | newContents nextPutAll: s; cr].
	contentsMorph contents: newContents contents.
