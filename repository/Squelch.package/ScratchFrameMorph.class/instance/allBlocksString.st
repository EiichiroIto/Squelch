uploading
allBlocksString

	| s stacks |
	s := WriteStream on: (String new: 10000).
	((Array with: workPane), self scratchObjects) do: [:obj |
		stacks := obj blocksBin submorphs select: [:m | m isKindOf: BlockMorph].
		stacks size > 0 ifTrue: [
			s nextPutAll: 'All stacks for ', obj objName, ':'; cr; cr.
			stacks do: [:blocks | self printTupleList: blocks tupleSequence on: s. s cr; cr].
			s cr]].

	^ s contents
