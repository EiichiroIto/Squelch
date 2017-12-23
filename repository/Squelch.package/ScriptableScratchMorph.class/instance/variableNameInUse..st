variables
variableNameInUse: varName
	"Answer true if the given variable name in the receiver would conflict with an existing variable or list. For example, if the receiver is the Stage and the given variable name is used by any sprite."

	| stage |
	(self allVarNames includes: varName) ifTrue: [^ true].

	self isSprite
		ifTrue: [
			(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ false].
			^ stage allVarNames includes: varName]
		ifFalse: [
			submorphs do: [:m |
				(m isKindOf: ScratchSpriteMorph) ifTrue: [
					(m allVarNames includes: varName) ifTrue: [^ true]]]].

	^ false
