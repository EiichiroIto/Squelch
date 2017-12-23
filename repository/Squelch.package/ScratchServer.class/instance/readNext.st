private-command parsing
readNext
	"Read the next command line token from 'in' or nil if there are not more tokens. A token is a quoted string, a number, a boolean, or an unquoted string with no embedded whitespace. Strings that start with a digit or minus sign must be quoted to avoid being treated as an integer."

	| ch s |
	"skip white space"
	[in atEnd not and: [in peek asciiValue <= 32]]
		whileTrue: [in next].
	in atEnd ifTrue: [^ nil].

	ch := in peek.
	ch = $" ifTrue: [^ self readQuotedString].
	(ch = $-) | (ch = $.) | ch isDigit ifTrue: [^ self readNumber].

	"unquoted string or boolean"
	s := self readString.
	'true' = s ifTrue: [^ true].
	'false' = s ifTrue: [^ false].
	^ s
