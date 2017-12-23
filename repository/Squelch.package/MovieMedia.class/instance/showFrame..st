private
showFrame: frameIndex
	"Go to the given frame.  updates only video, not sound."

	self movieFileIsOpen ifFalse: [^ self].
	movieFile hasVideo ifFalse: [^ self].
	currentFrame := frameIndex rounded max: 1.
	movieFile videoSetFrame: currentFrame stream: 0.
	movieFile videoReadFrameInto: origForm stream: 0.
	self updateOutForm.
