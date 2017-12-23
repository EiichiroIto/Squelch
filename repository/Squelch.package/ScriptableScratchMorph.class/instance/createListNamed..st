list ops
createListNamed: listName

	| list stage n |
	(self variableNameInUse: listName) ifTrue: [
		self beep.
		DialogBoxMorph warn: 'That variable name is already in use'.
		^ self].

	lists at: listName put: (list := ScratchListMorph new listName: listName target: self).
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [
		n := (stage submorphs select: [:m | m isKindOf: ScratchListMorph]) size.
		stage addMorph: (list position: stage topRight - ((list width + 10)@0) + (0@(10+(20*n)))).
		list startStepping].
