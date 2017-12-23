playing
drumOff
	"Turn of the currently sounding drum, if any."

	midiKey ifNotNil: [
		midiPort ifNotNil: [midiPort midiCmd: 16r90 channel: 9 byte: midiKey byte: 0].
		midiKey := nil].

	snd ifNotNil: [
		snd stopGracefully.
		snd := nil].
