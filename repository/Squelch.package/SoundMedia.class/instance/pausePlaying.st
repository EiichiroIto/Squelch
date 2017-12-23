scratch ops
pausePlaying
	"Pauses sound playback."

	playingSound ifNotNil: [playingSound pause].
