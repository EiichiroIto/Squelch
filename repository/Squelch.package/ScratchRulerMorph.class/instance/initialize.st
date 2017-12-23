initialize
initialize
	
	super initialize.
	min := 0.0.
	max := 100.
	marks := 20.0.
	sigDigs := 1. 
	graph := nil. "used specifically to coord with ScratchGraphMorph"

	self borderWidth: 1.
	self extent: 200@20.
	self color: Color white.