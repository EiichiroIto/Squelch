private
turnOffNote

	submorphs do: [:m | (m isKindOf: ScratchNoteSelectorKeyMorph) ifTrue: [m highlight: false]].
	notePlayer ifNotNil: [notePlayer noteOff].
	selectedVal := nil.
