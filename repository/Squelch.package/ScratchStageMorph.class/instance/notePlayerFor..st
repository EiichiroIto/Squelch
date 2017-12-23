midi
notePlayerFor: aScratchObject
	"Answer a note player for the given object, creating one if necessary. Open the MIDI port if necessary."

	| deletedMorphs channelUsage ch newCh newPlayer |
	midiPort ifNil: [self tryToOpenMidiPort].

	(notePlayerDict includesKey: aScratchObject) ifTrue: [
		^ notePlayerDict at: aScratchObject].

	"remove deleted morphs from the note player dictionary"
	deletedMorphs := notePlayerDict keys select: [:m | m owner isNil].
	deletedMorphs do: [:m | notePlayerDict removeKey: m].

	"find the channel used by the fewest objects"
	channelUsage := Array new: 16 withAll: 0.
	channelUsage at: 10 put: 1000000.  "make sure channel 10 (drums) is not chosen"
	notePlayerDict do: [:player |
		ch := player channel.
		channelUsage at: ch put: (channelUsage at: ch) + 1].
	newCh := channelUsage indexOf: channelUsage min.

	newPlayer := ScratchNotePlayer new
		channel: newCh;
		midiPort: midiPort;
		instrument: 1.
	notePlayerDict at: aScratchObject put: newPlayer.

	^ newPlayer
