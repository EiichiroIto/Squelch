movie ops
currentSeconds

	self movieFileIsOpen ifFalse: [^ 0].
	sound ifNotNil: [^ sound soundPosition * sound duration].
	^ movieFile currentSeconds: 0.
