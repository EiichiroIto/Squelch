private
turnOnNote: midiKey

	selectedVal := midiKey.
	self updateNoteDisplay: midiKey.
	notePlayer ifNotNil: [notePlayer noteOn: midiKey].
