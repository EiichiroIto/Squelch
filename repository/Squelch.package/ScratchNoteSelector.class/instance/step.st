stepping
step

	| keyMorph |
	Sensor peekAnyButtonPressed ifTrue: [^ self].
	keyMorph := submorphs
		detect: [:m |
			(m containsPoint: Sensor cursorPoint) and:
			[m isKindOf: ScratchNoteSelectorKeyMorph]]
		ifNone: [^ self].

	self updateNoteDisplay: keyMorph midiKey.
