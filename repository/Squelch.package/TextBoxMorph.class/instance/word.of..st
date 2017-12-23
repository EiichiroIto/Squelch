operations
word: wordIndex of: aString

	| words n |
	words := aString findTokens: ' 	'.
	words size = 0 ifTrue: [^ ''].
	n := wordIndex truncated.
	(n < 1) | (n > words size) ifTrue: [^ ''].
	^ words at: n

