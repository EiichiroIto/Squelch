scripts
scripts
	"Answer my scripts, a collection of HatBlockMorphs."

	(blocksBin isKindOf: Morph) ifFalse: [^ blocksBin].
	^ blocksBin submorphs select: [:m | m isKindOf: HatBlockMorph]
