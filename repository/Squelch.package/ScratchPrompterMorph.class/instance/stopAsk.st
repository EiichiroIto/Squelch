other
stopAsk
	"Stop button was pressed."

	done := true.
	self delete.
	sprite ifNotNil: [sprite sayNothing].
	World doOneCycle.  "erase myself from the screen"
