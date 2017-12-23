variables
changeVar: varName by: increment
	"Change the value of the given variable of this object by the given amount."

	| stage n |
	(vars includesKey: varName asString) ifFalse: [
		stage := self meOrOwnerThatIsA: ScratchStageMorph.
		(stage notNil and: [stage ~= self]) ifTrue: [
			stage changeVar: varName by: increment].
		^ self].

	n := vars at: varName asString ifAbsent: [^ self].
	self setVar: varName to: n asNumberNoError + increment asNumberNoError.
