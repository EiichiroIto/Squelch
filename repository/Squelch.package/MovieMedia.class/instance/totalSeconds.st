movie ops
totalSeconds

	movieFile ifNil: [^ 0].
	self movieFileIsOpen ifFalse: [^ 0].
	^ movieFile duration: 0
