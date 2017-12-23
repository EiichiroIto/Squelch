list ops
insertLine: aString at: aNumber

	| index newCell |
	index := aNumber asInteger.
	(index > 0 and: [index <= (cellMorphs size + 1)]) ifFalse: [
		lastActivityError := true.
		^ self].

	newCell := self createCell: aString.
	index = 1
		ifTrue: [cellMorphs addFirst: newCell]
		ifFalse: [
			index > cellMorphs size
				ifTrue: [cellMorphs addLast: newCell]
				ifFalse: [cellMorphs add: newCell afterIndex: index - 1]].

	self noteChangeAtIndex: index.
	^ newCell
