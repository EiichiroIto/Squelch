list ops
setLineAt: aNumber to: newContents

	| index |
	index := aNumber asInteger.
	(index > 0 and: [index <= cellMorphs size]) ifFalse: [
		lastActivityError := true.
		^ self].

	(cellMorphs at: index) firstSubmorph contents: newContents asString.
	self noteChangeAtIndex: index.

