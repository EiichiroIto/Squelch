variables
deleteVariable: varName
	"Delete the variable with the given name. Do nothing if the variable doesn't exist."

	| frame |
	frame := self meOrOwnerThatIsA: ScratchFrameMorph.
	frame ifNotNil: [frame deleteWatchersForVar: varName ofSprite: self].
	vars removeKey: varName asString ifAbsent: [^ self].
	self isClone: false.
