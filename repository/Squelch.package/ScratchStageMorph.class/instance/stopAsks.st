scratch processes/events
stopAsks
	"Stop/close any ask that is currently on the screen."

	ScratchPrompterMorph allInstancesDo: [:m | m stopAsk].
	ScratchPrompterMorph clearLastAnswer.
