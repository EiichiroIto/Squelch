midi
midiAllNotesOff
	"If the MIDI port is open, send an 'all notes off' command on every channel."

	midiPort ifNil: [^ self].	
	[midiPort ensureOpen] on: Error do: [self closeMIDI].
	notePlayerDict do: [:player | player noteOff].
