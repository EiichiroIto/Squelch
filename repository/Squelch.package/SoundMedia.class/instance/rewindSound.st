scratch ops
rewindSound
	"Rewind the playing sound, if any."

	playingSound ifNotNil: [playingSound sounds first reset].
