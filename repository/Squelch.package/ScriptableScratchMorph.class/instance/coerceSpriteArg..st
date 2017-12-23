sensing ops
coerceSpriteArg: anObject
	"Coerce the given object to a sprite reference if necessary. If it is a Symbol (e.g. #mouse), just return it. If it is a String, try to find a Sprite with that name. If it is a Number, coerce it to a string and look for a Sprite with a matching name."

	| s targetName |
	(anObject isKindOf: ScriptableScratchMorph) ifTrue: [^ anObject].
	(anObject isKindOf: Symbol) ifTrue: [^ anObject].

	targetName := anObject isNumber ifTrue: [anObject printString] ifFalse: [anObject].

	(s := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ nil].
	s submorphsDo: [:m |
		((m isKindOf: ScriptableScratchMorph) and:
		 [targetName = m objName])
			ifTrue: [^ m]].

	^ nil

