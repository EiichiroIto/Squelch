list ops
deleteLineAt: aNumber

	| index |
	index := aNumber asInteger.
	(index > 0 and: [index <= cellMorphs size]) ifFalse: [
		lastActivityError := true.
		^ self].

	index = numberMorphs size ifTrue: [
		numberMorphs last delete.
		numberMorphs := numberMorphs copyFrom: 1 to: numberMorphs size - 1].

	(cellMorphs removeAt: index) delete.
	self noteChangeAtIndex: index.
