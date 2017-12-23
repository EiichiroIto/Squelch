intialization
initialize
	"Initialize the forms for all my elements."

	super initialize.
	self initFromForm: (ScratchFrameMorph skinAt: #talkBubbleFrame).
	self beThoughtBubble: false.
	pointLeft := false.

	contentsMorph := MultilineStringMorph new
		centerText: true;
		font: (ScratchFrameMorph getFont: #TalkBubble).
	contentsMorph
		borderWidth: 0;
		lock.
	self addMorph: contentsMorph.
