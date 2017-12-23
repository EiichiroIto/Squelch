movie ops
currentSeconds: seconds
	"Jump to the given seconds offset."

	| fraction totalFrames totalSecs |
	sound ifNotNil: [
		fraction := ((seconds asFloat / sound duration) max: 0.0) min: 1.0.
		sound soundPosition: seconds asFloat / sound duration].

	(movieFile notNil and: [movieFile hasVideo]) ifTrue: [
		totalFrames := movieFile videoFrames: 0.
		fraction ifNil: [
			totalSecs := totalFrames asFloat / (movieFile videoFrameRate: 0).
			totalSecs > 0
				ifTrue: [fraction := seconds / totalSecs]
				ifFalse: [fraction := 0]].
		self showFrame: fraction * totalFrames].

	lastFrameMSecs := Time millisecondClockValue.
