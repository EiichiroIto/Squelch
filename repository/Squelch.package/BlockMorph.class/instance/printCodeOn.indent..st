private
printCodeOn: aStream indent: indent
	"Append a human-readable string for this block on the given stream."

	indent timesRepeat: [aStream nextPutAll: '    '].
	aStream nextPutAll: self class name; cr.
	self nextBlock ifNotNil: [self nextBlock printCodeOn: aStream indent: indent].
