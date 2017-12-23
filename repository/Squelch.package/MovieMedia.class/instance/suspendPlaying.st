movie ops
suspendPlaying
	"This method is called when switching costumes. Stop playing, but leave the moviePlaying flag alone."

	| tmp |
	tmp := moviePlaying.
	self stopPlaying.
	moviePlaying := tmp.

