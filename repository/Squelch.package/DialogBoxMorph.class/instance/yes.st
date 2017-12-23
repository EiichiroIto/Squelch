interaction
yes
	"Yes button was pressed."

	response := true.
	done := true.
	self delete.
	World doOneCycle.  "erase myself from the screen"
