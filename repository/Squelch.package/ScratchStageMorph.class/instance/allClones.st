clones
allClones
	"Answer a collection of all sprite clones."

	^ self submorphs select: [:m |
		(m isKindOf: ScriptableScratchMorph) and: [m isClone]].
