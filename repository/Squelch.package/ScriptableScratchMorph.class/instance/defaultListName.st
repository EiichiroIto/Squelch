list ops
defaultListName

	| stage |
	lists size > 0 ifTrue: [^ lists keys asArray sort first].

	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [
		stage lists size > 0 ifTrue: [^ stage lists keys asArray sort first]].

	^ ''
