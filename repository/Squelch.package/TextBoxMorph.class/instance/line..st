operations
line: lineIndex

	| lines n |
	lines := contentsMorph contents lines asOrderedCollection.
	lines size = 0 ifTrue: [^ ''].
	n := lineIndex truncated.
	(n < 1) | (n > lines size) ifTrue: [^ ''].

	^ lines at: n

