list ops
deleteList: listName
	"Delete the list variable with the given name. Do nothing if the variable doesn't exist."

	| stage |
	stage := self meOrOwnerThatIsA: ScratchStageMorph.
	lists removeKey: listName asString ifAbsent: [].
	stage submorphs do: [:m |
		((m isKindOf: ScratchListMorph) and: 
		[(m listName = listName) and: 
		[m target = self]])
			ifTrue: [m delete]].
