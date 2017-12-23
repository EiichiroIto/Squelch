accessing
channel: aNumber
	"Change my MIDI channel. This first turns off any notes in progress on the current channel."

	channel := aNumber rounded min: 16 max: 1.
