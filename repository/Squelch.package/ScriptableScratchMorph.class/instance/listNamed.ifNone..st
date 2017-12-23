list ops
listNamed: aString ifNone: aBlock
	"Answer a list with the given name. First check the local list variables, otherwise check the global list variables. If there is no list variable with the given name, return the result of evaluating the given block."

	| result stage |
	(result := lists at: aString ifAbsent: [nil]) ifNotNil: [^ result].

	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [
		(result := stage lists at: aString ifAbsent: [nil]) ifNotNil: [^ result]].

	^ aBlock value
