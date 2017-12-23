scratch processes/events
stopAllSounds
	"Stop all sounds and MIDI notes/drums."

	SoundPlayer shutDown.
	self midiAllNotesOff.

