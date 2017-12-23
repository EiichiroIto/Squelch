accessing
selection: anArrayOrNil
	"Set the selection to the given (startIndex, stopIndex) pair to to nil."

	anArrayOrNil
		ifNil: [	selection at: 1 put: nil. selection at: 2 put: nil]
		ifNotNil: [ selection := anArrayOrNil.].

