other
accept
	"Accept button was pressed."

	LastAnswer := typeinMorph contents.
	done := true.
	self delete.
	sprite ifNotNil: [sprite sayNothing].
	World doOneCycle.  "erase myself from the screen"
