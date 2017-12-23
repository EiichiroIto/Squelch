midi
closeMIDI
	"Close the MIDI port and clear the note player dictionary."

	midiPort ifNotNil: [
		midiPort close.
		midiPort := nil].
	notePlayerDict := Dictionary new.
