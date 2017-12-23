event handling
mouseMove: evt
	"If the user drags away from the original selection and comes back, don't consider it a virtual double-click."

	(self highlightEntryAt: evt cursorPoint)
		ifFalse: [isDoubleClick := false].

	scratchInfoClient ifNotNil: [self reportScratchProjectInfo].
