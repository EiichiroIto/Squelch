accessing
stopMIDI

	(self startValue isKindOf: ScratchNotePlayer)
		ifTrue: [startValue noteOff].
