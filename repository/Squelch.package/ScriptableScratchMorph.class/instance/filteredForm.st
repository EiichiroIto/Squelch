accessing
filteredForm

	filterPack ifNil: [^ self rotatedForm].

	filterPack filtersActive ifTrue: [  "filter parameters have changed; apply filters"
		ScratchFrameMorph useErrorCatcher
			ifTrue: [[filterPack applyFiltersTo: self rotatedForm]
						ifError: [filterPack := nil. ^ self rotatedForm]]
			ifFalse: [filterPack applyFiltersTo: self rotatedForm]].
	^ filterPack resultForm
