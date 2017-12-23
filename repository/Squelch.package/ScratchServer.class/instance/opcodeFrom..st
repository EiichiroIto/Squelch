private-incoming commands
opcodeFrom: aString
	"Answer the command opcode for the given message. The opcode is the unquoted string at the beginning of the message up to the first whitespace character."

	| i |
	i := 1.
	[i <= aString size and: [(aString at: i) asciiValue > 32]]
		whileTrue: [i := i + 1].

	^ (aString copyFrom: 1 to: i - 1) asLowercase
