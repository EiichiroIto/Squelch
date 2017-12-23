language translation
uiTranslationSetAsSortedArray

	^ self uiTranslationSet asArray
		sort: [:a :b | a asLowercase <= b asLowercase]
