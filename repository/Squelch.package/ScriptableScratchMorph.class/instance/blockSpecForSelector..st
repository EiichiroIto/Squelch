blocks
blockSpecForSelector: aSymbol
	"Answer a block specification string (in English) for the give selector or nil if there is no spec that has the given selector."

	self class blockSpecs do: [:spec |
		((spec isKindOf: Array) and: [(spec at: 3) = aSymbol])
			ifTrue: [^ spec first]].

	^ nil
