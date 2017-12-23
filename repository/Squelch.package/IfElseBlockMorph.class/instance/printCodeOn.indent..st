private
printCodeOn: aStream indent: indent
	"Append a human-readable string for this block on the given stream."

	indent timesRepeat: [aStream nextPutAll: '    '].
	submorphs do: [:m |
		(m ~~ trueBlock) & (m ~~ falseBlock) & (m ~~ nextBlock) ifTrue: [
			self printCodeSubmorph: m on: aStream.
			aStream space]].
	aStream cr.
	trueBlock ifNotNil: [trueBlock printCodeOn: aStream indent: indent + 1].
	indent timesRepeat: [aStream nextPutAll: '    '].
	aStream nextPutAll: 'else'; cr.
	falseBlock ifNotNil: [falseBlock printCodeOn: aStream indent: indent + 1].
	nextBlock ifNotNil: [nextBlock printCodeOn: aStream indent: indent].
