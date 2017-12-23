private
printCodeOn: aStream indent: indent
	"Append a human-readable string for this block on the given stream."

	indent timesRepeat: [aStream nextPutAll: '    '].
	self printHatNameOn: aStream.
	self nextBlock ifNotNil: [self nextBlock printCodeOn: aStream indent: indent + 1].
	indent timesRepeat: [aStream nextPutAll: '    '].
	aStream nextPutAll: 'end'; cr.
