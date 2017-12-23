blocks
convertTuplesToStacks
	"Convert my blocks bin from a collection of (<point>, <tuple>) pairs into a morph containing a number of block stacks."

	| tuplesList stack |
	(blocksBin isKindOf: Array) ifFalse: [^ self].  "already converted"
	tuplesList := blocksBin.
	blocksBin := ScratchScriptsMorph new.
	tuplesList do: [:pair |
		stack := self stackFromTupleList: pair second receiver: self.
		stack position: pair first.
		blocksBin addMorph: stack].
