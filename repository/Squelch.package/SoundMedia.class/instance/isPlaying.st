scratch ops
isPlaying
	"Answer true if my sound is playing."

	^ (playingSound notNil and: [playingSound isPlaying])
