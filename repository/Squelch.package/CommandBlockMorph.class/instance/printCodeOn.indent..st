private
printCodeOn: aStream indent: indent
	"Append a human-readable string for this block on the given stream."

	| nextB hasFinalSpace |
	indent timesRepeat: [aStream nextPutAll: '    '].
	nextB := self nextBlock.
	hasFinalSpace := false.
	submorphs do: [:m |
		m ~~ nextB ifTrue: [
			self printCodeSubmorph: m on: aStream.
			hasFinalSpace := true.
			aStream space]].
	hasFinalSpace ifTrue: [aStream skip: -1].
	aStream cr.
	self nextBlock ifNotNil: [self nextBlock printCodeOn: aStream indent: indent].
