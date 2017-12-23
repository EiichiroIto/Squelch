uploading
scriptsStringForUpload

	| s scripts |
	s := WriteStream on: (String new: 10000).
	((Array with: workPane), self scratchObjects) do: [:obj |
		scripts := obj blocksBin submorphs select: [:m | m isKindOf: HatBlockMorph].
		scripts size > 0 ifTrue: [
			s nextPutAll: 'Scripts for ', obj objName, ':'; cr; cr.
			scripts do: [:hat | self printTupleList: hat tupleSequence on: s. s cr].
			s cr]].
	^ s contents
