translation support
blockSpecsArrayForTranslation
	"Answer an array that lists all the blocks and categories to be used as a guide to block translation."
	"self blockSpecDictForTranslation"

	| blocks all obsolete currentSpecs |
	currentSpecs := Set new.
	ScratchSpriteMorph new blockCategories sort collect: [:cat |
		blocks :=  (ScratchSpriteMorph new blocksFor: cat)
			select: [:b | b isKindOf: CommandBlockMorph].
		all := blocks collect: [:b | b commandSpec].
		obsolete := ScriptableScratchMorph obsoleteBlockSpecs collect: [:o | o first].
		all :=  all select: [:p | (obsolete indexOf: p) = 0].
		(cat beginsWith: 'obsolete') ifFalse:[currentSpecs add: cat].
		currentSpecs addAll: all].
	currentSpecs := currentSpecs asArray sort.
	^ currentSpecs
