language translation
uiTranslationSet

	#('' '?'), ScriptableScratchMorph blockSpecsForTranslation do: [:e |
		UITranslationSet remove: e ifAbsent: []].

	^ UITranslationSet
