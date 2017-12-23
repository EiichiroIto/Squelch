intialization
beThoughtBubble: aBoolean
	"If true, then be a thought bubble. Otherwise, be a talk bubble."

	aBoolean
		ifTrue: [leftPointerForm := (ScratchFrameMorph skinAt: #talkBubbleThinkPointer)]
		ifFalse: [leftPointerForm := (ScratchFrameMorph skinAt: #talkBubbleTalkPointer)].
	rightPointerForm := leftPointerForm flipBy: #horizontal centerAt: leftPointerForm center.
