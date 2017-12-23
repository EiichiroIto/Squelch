event handling
mouseEnter: evt

	(#resize = type)
		ifTrue: [self form: (ScratchFrameMorph skinAt: #spriteResizeOver)]
		ifFalse: [self form: (ScratchFrameMorph skinAt: #spriteRotateOver)].
