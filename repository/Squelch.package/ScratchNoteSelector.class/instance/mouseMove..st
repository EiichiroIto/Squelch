event handling
mouseMove: evt

	| keyMorph k |
	evt anyButtonPressed ifFalse: [^ self].
	keyMorph := submorphs
		detect: [:m |
			(m containsPoint: evt cursorPoint) and:
			[m isKindOf: ScratchNoteSelectorKeyMorph]]
		ifNone: [nil].
	keyMorph
		ifNil: [self turnOffNote]
		ifNotNil: [
			k := keyMorph midiKey.
			k = selectedVal ifTrue: [^ self].
			self turnOffNote.
			keyMorph highlight: true.
			self turnOnNote: k.
			selectedVal := k].
