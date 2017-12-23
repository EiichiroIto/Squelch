scratch ops
playFrom: secs
	"Play from the given point through the end of the sound."

	self playFrom: secs to: self totalSeconds.
