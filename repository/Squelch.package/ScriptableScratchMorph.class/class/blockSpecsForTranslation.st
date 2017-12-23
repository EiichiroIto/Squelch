translation support
blockSpecsForTranslation
	"Answer a collection blocks for translation. Obsolete blocks are removed."

	| allSpecs |
	allSpecs := Set new.
	(ScriptableScratchMorph blockSpecs,
	 ScratchSpriteMorph blockSpecs,
	 ScratchStageMorph blockSpecs) do: [:el |
		(el isKindOf: Array)
			ifTrue: [allSpecs add: el first]
			ifFalse: [((el beginsWith: 'obsolete') or:[#('-' '~') includes: el])
				ifFalse:[allSpecs add: el]]].
	ScriptableScratchMorph obsoleteBlockSpecs do: [:el |
		(el isKindOf: Array) ifTrue: [allSpecs remove: el first ifAbsent: []]].
	allSpecs
		add: 'else';
		add: 'variables';
		add: 'set %v to %n';
		add: 'change %v by %n'.
	^ allSpecs asArray sort
