event handling
updateToolbarButtons

	toolbarButtons ifNil: [^ self].
	toolbarButtons allMorphsDo: [:b |
		(b isKindOf: ToggleButton) ifTrue: [
			b arguments first = self mode ifTrue: [b on] ifFalse: [b off]]].
