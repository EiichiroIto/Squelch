list ops
lineAt: aNumber

	| index |
	index := aNumber asInteger.
	(index > 0 and: [index <= cellMorphs size])
		ifTrue: [
			self noteChangeAtIndex: index.
			^ (cellMorphs at: index) firstSubmorph contents]
		ifFalse: [
			lastActivityError := true.
			^ ''].
