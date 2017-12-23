operations
removeLine: lineIndex

	| lines n result newContents |
	lines := contentsMorph contents lines asOrderedCollection.
	n := lineIndex truncated.
	((n < 1) or: [n > lines size]) ifTrue: [^ ''].
	result := lines at: n.
	lines removeIndex: n.

	newContents := WriteStream on: (String new: 1000).
	lines do: [:s | newContents nextPutAll: s; cr].
	contentsMorph contents: newContents contents.

	^ result

