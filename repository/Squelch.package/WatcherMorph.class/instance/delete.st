right button menu
delete

	super delete.
	ScratchFrameMorph allInstancesDo: [:frame | frame deletingWatcher].
