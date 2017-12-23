blocks
stackFromTupleList: tupleList receiver: scriptOwner
	"Answer a new block stack from the given sequence of tuples."
	"self stackFromTupleList: #() receiver: nil"

	| stackTop previousBlock block |
	stackTop := previousBlock := nil.
	tupleList do: [:tuple |
		block := self blockFromTuple: tuple receiver: scriptOwner.
		previousBlock
			ifNil: [stackTop := block]
			ifNotNil: [previousBlock nextBlock: block].
		previousBlock := block].

	^ stackTop
