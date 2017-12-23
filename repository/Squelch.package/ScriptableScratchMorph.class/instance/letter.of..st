string ops
letter: index of: anObject
	"Answer the ith letter of the given string. Answer the empty string if the index is out of bounds."

	| s i |
	s := anObject asString.
	i := self letterNum: index of: s.
	((i < 1) | (i > s size)) ifTrue: [^ ''].
	^ (s at: i) asString