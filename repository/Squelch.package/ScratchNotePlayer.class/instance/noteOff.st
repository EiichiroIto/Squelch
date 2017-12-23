playing
noteOff
	"Turn of the currently sounding note, if any."

	midiKey ifNotNil: [
		midiPort ifNotNil: [midiPort midiCmd: 16r90 channel: (channel - 1) byte: midiKey byte: 0].
		midiKey := nil].

	snd ifNotNil: [
		snd stopGracefully.
		snd := nil].
