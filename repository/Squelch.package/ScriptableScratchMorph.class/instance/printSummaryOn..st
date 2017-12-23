private
printSummaryOn: aStream

	| costumes snds stacks hats otherStacks |
	aStream nextPutAll: 'Sprite: ', self objName; crlf.

	costumes := media select: [:item | item isImage].
	aStream nextPutAll: '  Costumes (', costumes size printString, '):'; crlf.
	costumes do: [:item |
		aStream nextPutAll: '    ', item mediaName, ' (', item infoString, ')'; crlf].

	snds := media select: [:item | item isSound].
	aStream nextPutAll: '  Sounds (', snds size printString, '):'; crlf.
	snds do: [:item |
		aStream nextPutAll: '    ', item mediaName, ' (', item infoString, ')'; crlf].

	stacks := blocksBin submorphs select: [:m | m isKindOf: BlockMorph].
	stacks size = 0 ifTrue: [
		aStream nextPutAll: '  No stacks.'; crlf; crlf.
		^ self].
	aStream nextPutAll: '  Stacks (', stacks size printString, '):'; crlf.

	hats := stacks select: [:m | m isKindOf: HatBlockMorph].
	otherStacks := stacks select: [:m | (m isKindOf: HatBlockMorph) not].

	hats, otherStacks do: [:item |
		item printCodeOn: aStream indent: 1.
		(item isKindOf: ReporterBlockMorph) ifTrue: [aStream crlf].
		aStream crlf].

