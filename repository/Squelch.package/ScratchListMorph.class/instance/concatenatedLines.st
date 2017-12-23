list ops
concatenatedLines

	| isSingleLetters s |
	isSingleLetters := true.
	cellMorphs do: [:m |
		isSingleLetters ifTrue: [
			m firstSubmorph contents size <= 1 ifFalse: [isSingleLetters := false]]].

	s := WriteStream on: (String new: 1000).
	isSingleLetters
		ifTrue: [
			cellMorphs do: [:m | s nextPutAll: m firstSubmorph contents]]
		ifFalse: [
			cellMorphs do: [:m | s nextPutAll: m firstSubmorph contents; space].
			s position > 0 ifTrue: [s skip: -1]].

	^ s contents
