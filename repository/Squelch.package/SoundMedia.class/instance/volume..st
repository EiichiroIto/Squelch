accessing
volume: aNumber
	"Set my volume, a number between 0 and 100."

	volume := (aNumber rounded max: 0) min: 100.
	playingSound ifNotNil: [
		playingSound setPan: (balance / 100.0) volume: (volume / 100.0) for: 1].
