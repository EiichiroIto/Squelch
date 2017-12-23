accessing
width: aNumber

	super width: (self defaultWidth max: aNumber).
	commentMorph notNil & resizeMorph notNil ifTrue: [
		commentMorph width: self width - resizeMorph width].
