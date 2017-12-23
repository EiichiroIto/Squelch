accessing
delete

	self detach.
	ScratchFrameMorph putInClipboard: self.
	super delete
