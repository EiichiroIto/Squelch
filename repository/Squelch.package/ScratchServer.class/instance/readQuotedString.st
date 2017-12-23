private-command parsing
readQuotedString

	| result ch |
	result := WriteStream on: String new.
	in next.  "skip opening quote"
	[in atEnd] whileFalse: [
		ch := in next.
		ch = $" ifTrue: [
			in peek = $"
				ifTrue: [in skip: 1]
				ifFalse: [^ result contents]].
		result nextPut: ch].

	^ result contents
