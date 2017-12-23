interaction
cancelled
	"Cancel button was pressed."

	response := #cancelled.
	done := true.
	self delete.
	World doOneCycle.  "erase myself from the screen"
