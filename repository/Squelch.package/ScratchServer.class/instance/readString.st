private-command parsing
readString

	| result ch |
	result := WriteStream on: String new.
	[in atEnd] whileFalse: [
		ch := in peek.
		ch asciiValue <= 32 ifTrue: [^ result contents].
		result nextPut: in next].

	^ result contents
