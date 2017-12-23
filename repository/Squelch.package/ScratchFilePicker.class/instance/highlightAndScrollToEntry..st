private
highlightAndScrollToEntry: e

	e highlight: true.
	contentsPaneMorph scrollSubmorphIntoView: e.
	scratchInfoClient ifNotNil: [self reportScratchProjectInfo].
