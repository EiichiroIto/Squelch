accessing
balance: aNumber
	"Set my left-right balance, a number between 0 and 100, where 50 is centered."

	balance := (aNumber rounded max: 0) min: 100.
	playingSound ifNotNil: [
		playingSound setPan: (balance / 100.0) volume: (volume / 100.0) for: 1].
