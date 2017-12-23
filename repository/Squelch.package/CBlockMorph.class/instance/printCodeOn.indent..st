private
printCodeOn: aStream indent: indent
	"Append a human-readable string for this block on the given stream."

	indent timesRepeat: [aStream nextPutAll: '    '].
	submorphs do: [:m |
		(m ~~ nestedBlock) & (m ~~ nextBlock) ifTrue: [
			self printCodeSubmorph: m on: aStream.
			aStream space]].
	aStream cr.
	nestedBlock ifNotNil: [nestedBlock printCodeOn: aStream indent: indent + 1].
	nextBlock ifNotNil: [nextBlock printCodeOn: aStream indent: indent].
