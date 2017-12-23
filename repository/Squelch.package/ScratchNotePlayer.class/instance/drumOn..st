playing
drumOn: aNumber
	"Play the given drum number at the current volume level. The drum number is defined by the General MIDI spec, which you can find on the web. The absolute value of the rounded drum number is used."

	| vol |
	midiKey := aNumber rounded abs min: 127 max: 0.
	midiPort
		ifNil: [
			snd := (SampledSound
					samples: SampledSound coffeeCupClink
					samplingRate: 11025) copy.
			snd
				setPitch: (AbstractSound pitchForMIDIKey: midiKey)
				dur: 1000
				loudness: ((volume / 500.0) min: 1.0 max: 0.0).
			snd play]
		ifNotNil: [
			vol := (1.27 * volume) rounded min: 127 max: 0.
			midiPort midiCmd: 16r90 channel: 9 byte: midiKey byte: vol].
