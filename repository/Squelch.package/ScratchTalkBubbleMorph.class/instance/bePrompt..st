intialization
bePrompt: aBoolean

	self initFromForm: (ScratchFrameMorph skinAt: #promptBubbleFrame).
	aBoolean
		ifTrue: [leftPointerForm := (ScratchFrameMorph skinAt: #promptBubblePointer)]
		ifFalse: [leftPointerForm := (ScratchFrameMorph skinAt: #talkBubbleTalkPointer)].
	rightPointerForm := leftPointerForm flipBy: #horizontal centerAt: leftPointerForm center.
	self changed.
