movie ops
frameCount

	movieFile ifNil: [^ 1].
	(self movieFileIsOpen and: [movieFile hasVideo])
		ifTrue: [^ movieFile videoFrames: 0]
		ifFalse: [^ 1].
