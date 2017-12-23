tools (no longer used)
normalTool

	self paintingInProgress ifTrue: [^ self beep].
	self world activeHand toolType: nil.
