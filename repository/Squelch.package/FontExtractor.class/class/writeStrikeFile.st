utilities
writeStrikeFile
	"Use this method to write a text file that will be used to make a font image for processing. See my class comment for what to do with this file."
	"FontExtractor writeStrikeFile"

	| f |
	f := (FileStream newFileNamed: 'strike.txt') binary.
	f nextPutAll: '  . .  . x', String crlf, String crlf.
	33 to: 255 do: [:ch |
		(ch \\ 16) = 0 ifTrue: [f nextPutAll: '  .', String crlf, String crlf].
		f nextPutAll: '   . '.
		f nextPut: ch].
	f nextPutAll: '  . ', String crlf, String crlf.
	f close.
