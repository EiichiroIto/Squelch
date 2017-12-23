interaction
message: aMessage
	"Set my message/question text."

	self
		message: aMessage localized
		font: (ScratchFrameMorph getFont: #DialogBoxMessage).
