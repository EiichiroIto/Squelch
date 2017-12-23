other
updateWatcherButtonsForFrame: frame
	"Update the watcher button on this palette."

	| reporter sprite selAndArg |
	frame ifNil: [^ self].

	submorphs do: [:b |
		((b isKindOf: ToggleButton) and:
		 [b target isKindOf: ReporterBlockMorph]) ifTrue: [
			reporter := b target.
			sprite := reporter getAssociatedSprite.
			selAndArg := reporter selectorAndArg.
			(frame watcherShowingFor: sprite selectorAndArg: selAndArg)
				ifTrue: [b on; setProperty: #balloonText toValue: 'Remove viewer from stage' localized]
				ifFalse: [b off; setProperty: #balloonText toValue: 'View on stage' localized]]].
