private
advanceFrameWithSound
	"Used in the step method when a movie that has sound is playing."

	| syncMSecs msecs desiredFrame currFrame |
	sound isPlaying ifFalse: [^ self startPlaying].  "loop back to beginning"

	syncMSecs := -70.  "fudge factor to get better sound/video sync"
	msecs := sound millisecondsSinceStart - SoundPlayer bufferMSecs + syncMSecs.
	desiredFrame := (msecs // msecsPerFrame) + 1.
	desiredFrame := desiredFrame min: (movieFile videoFrames: 0).
	currFrame := movieFile videoGetFrame: 0.
	desiredFrame = currFrame ifFalse: [self showFrame: desiredFrame].
