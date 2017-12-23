private-variables
putString: aString on: aStream
	"Append the given string to the given stream. Double any embedded double-quote characters."

	aStream nextPut: $".
	aString do: [:ch |
		aStream nextPut: ch.
		ch = $" ifTrue: [aStream nextPut: ch]].
	aStream nextPut: $".
