playing
noteOn: aNumber
	"Play the given note at the current volume level. The note number gives the piano key number where 60 is middle-C and there are 12 keys per octave.  The absolute value of the note number is used."

	| vol |
	midiKey := aNumber rounded abs min: 127 max: 0.
	midiPort
		ifNil: [
			snd := FMSound organ1.
			snd
				setPitch: (AbstractSound pitchForMIDIKey: midiKey)
				dur: 1000
				loudness: ((volume / 100.0) min: 1.0 max: 0.0).
			snd play]
		ifNotNil: [
			vol := (1.27 * volume) rounded min: 127 max: 0.
			midiPort midiCmd: 16r90 channel: (channel - 1) byte: midiKey byte: vol].

