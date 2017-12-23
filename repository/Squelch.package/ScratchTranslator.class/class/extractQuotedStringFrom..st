language translation
extractQuotedStringFrom: aString
	"Extract the contents of a quoted string from a translation file line. If the line contains no double-quote characters, the string after the first space character is returned or, if there is no space character, the entire line. Only two escape sequences are currently recognized: newline and double-quote."

	| i s result ch |
	i := aString indexOf: $".
	i = 0 ifTrue: [aString indexOf: String space].
	s := ReadStream on: (aString copyFrom: i + 1 to: aString size).

	result := WriteStream on: String new.
	[s atEnd] whileFalse: [
		ch := s next.
		ch = $" ifTrue: [^ result contents].
		ch = $\
			ifTrue: [
				ch := s next.
				ch = $n ifTrue: [result cr].
				ch = $" ifTrue: [result nextPut: $"]]
			ifFalse: [result nextPut: ch]].
