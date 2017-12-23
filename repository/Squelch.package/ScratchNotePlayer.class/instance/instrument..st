accessing
instrument: aNumber
	"Set the MIDI instrument number between 1 and 128. Instrument number 1 is piano. The instrument numbers are defined by the General MIDI specification; you can find the list of instruments on the web."

	| instr |
	instr := aNumber rounded min: 128 max: 1.
	midiPort ifNotNil: [
		midiPort midiCmd: 16rC0 channel: (channel - 1) byte: (instr - 1)].
