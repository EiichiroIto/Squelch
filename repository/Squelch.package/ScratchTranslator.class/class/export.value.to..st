import/export
export: keyString value: aStringOrUTF8 to: aStream
	"Write the given string to the given stream as a quoted gettext format. If the string is multiple lines. store it as a sequence of strings in double quotes, each ending with '\n'."

	| lines |
	aStream nextPutAll: keyString; space.
	lines := (String withAll: aStringOrUTF8) lines.
	lines size = 1
		ifTrue: [aStream nextPut: $"; nextPutAll: lines first; nextPut: $"; crlf]
		ifFalse: [
			aStream nextPutAll: '""'; crlf.
			lines do: [:s | aStream nextPut: $"; nextPutAll: s; nextPutAll: '\n"'; crlf]].
