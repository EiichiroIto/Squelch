event handling
mouseLeave: evt

	(#resize = type)
		ifTrue: [self form: (ScratchFrameMorph skinAt: #spriteResize)]
		ifFalse: [self form: (ScratchFrameMorph skinAt: #spriteRotate)].
