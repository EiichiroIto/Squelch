movie ops
forwardSeconds: aNumber
	"Go forward the given number of seconds. Go backward if the argument is negative. Wrap at the ends."

	| newFrame |
	newFrame := currentFrame + ((1000.0 * aNumber) // msecsPerFrame).
	(newFrame < 1 or: [newFrame > self frameCount]) ifTrue: [
		newFrame := ((newFrame - 1) \\ self frameCount) + 1].
	self currentFrame: newFrame.
