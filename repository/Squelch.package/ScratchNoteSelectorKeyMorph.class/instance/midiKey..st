accessing
midiKey: anInteger
	"Set my midiKey, which determines the pitch of this note. Middle-C is 60."

	midiKey := anInteger.
	self highlight: false.
