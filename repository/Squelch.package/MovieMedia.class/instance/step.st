stepping
step
	"If I have a movie file and it is playing, advance to the next frame if it is time."

	| now deltaT newFrame |
	moviePlaying ifFalse: [^ self].
	self movieFileIsOpen ifFalse: [
		moviePlaying := false.
		^ self].

	movieFile hasVideo ifFalse: [^ self].  "no video"
	sound ifNotNil: [^ self advanceFrameWithSound].  "sync frame rate to sound"

	now := Time millisecondClockValue.
	deltaT := now - lastFrameMSecs.
	(deltaT < 0 or: [deltaT >= msecsPerFrame]) ifTrue: [
		newFrame := currentFrame + (deltaT // msecsPerFrame).
		newFrame > self frameCount ifTrue: [newFrame := 1].
		self showFrame: newFrame.
		lastFrameMSecs := now].
