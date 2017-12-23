dropping/grabbing
delete

	super delete.
	ScratchFrameMorph allInstancesDo: [:frame | frame deletingWatcher].
