variables
ensureListExists: listName
	"If a list with the given name is not visible to this object, make one."

	| stage |
	(lists includesKey: listName) ifTrue: [^ self].
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [
		(stage listVarNames includes: listName) ifTrue: [^ self]].

	"list not found; create it"
	lists at: listName put: (ScratchListMorph new listName: listName target: self).

