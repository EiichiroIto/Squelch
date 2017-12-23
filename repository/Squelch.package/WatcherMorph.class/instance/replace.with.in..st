private
replace: argStr with: translatedArg in: s
	"Answer a copy of the given string in which the first (only) occurance of argStr is replaced by translatedArg."

	| i |
	i := s findString: argStr startingAt: 1.
	i = 0 ifTrue: [^ s].
	^ ((s copyFrom: 1 to: i - 1), translatedArg, (s copyFrom: i + argStr size to: s size))
