variables
ensureVariableExists: varName
	"Make sure that the variable with the given name is visible to this object. Do nothing if the variable already exists."

	| stage |
	(vars includesKey: varName) ifTrue: [^ self].
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [
		(stage varNames includes: varName) ifTrue: [^ self]].

	"variable not found; create it"
	vars at: varName asString put: 0.
