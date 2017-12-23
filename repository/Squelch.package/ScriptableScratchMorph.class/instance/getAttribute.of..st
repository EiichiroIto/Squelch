sensing ops
getAttribute: attr of: anObject
	"Answer the variable or built-in attribute value for the given sprite. Answer zero if the given sprite does not have a built-in attribute or variable of the given name."

	| aSpriteOrStage |
	aSpriteOrStage := self coerceSpriteArg: anObject.

	(aSpriteOrStage isKindOf: ScriptableScratchMorph) ifFalse: [^ 0].
	^ aSpriteOrStage getAttribute: attr asString
