view mode
updateViewModeButtons

	viewModeButtons do: [:b | b off].
	viewModeButtons do: [:b |
		(b actionSelector = #enterQuarterMode and: [viewMode = #quarter])
			ifTrue: [b on].
		(b actionSelector = #enterNormalMode and: [viewMode = #normal])
			ifTrue: [b on].
		(b actionSelector = #enterPresentationMode and: [viewMode = #presentation])
			ifTrue: [b on]].
