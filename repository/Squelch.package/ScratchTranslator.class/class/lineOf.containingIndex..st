import/export
lineOf: aString containingIndex: anIndex
	"Answer the line of the given string that contains the given index."

	| cr lf i j ch |
	cr := Character cr.
	lf := Character lf.
	i := j := (anIndex min: aString size max: 1).
	[(i > 1) and: [((ch := aString at: i - 1) ~= cr) & (ch ~= lf)]] whileTrue: [i := i - 1].
	[(j < aString size) and: [((ch := aString at: j + 1) ~= cr) & (ch ~= lf)]] whileTrue: [j := j + 1].
	^ aString copyFrom: i to: j
