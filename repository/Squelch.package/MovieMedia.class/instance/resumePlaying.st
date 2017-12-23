movie ops
resumePlaying
	"This method is called when switching costumes. If I was playing when I was switched out, resume playing."

	moviePlaying ifTrue: [
		moviePlaying := false.
		self startPlaying].
