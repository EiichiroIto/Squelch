variables
setVar: varName to: newValue
	"Set the value of the given variable of this object to the given value."

	| vName stage |
	vName := varName asString. "convert Symbol to String if needed"
	(vars includesKey: vName) ifFalse: [
		stage := self meOrOwnerThatIsA: ScratchStageMorph.
		(stage notNil and: [stage ~= self]) ifTrue: [
			stage setVar: varName to: newValue].
		^ self].

	vars at: vName put: newValue.
