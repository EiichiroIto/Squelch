private
changeSelectionIndexBy: anInteger

	| entries e newI |
	self stopPlayingSound.

	entries := contentsPaneMorph contents submorphs.
	entries size = 0 ifTrue: [^ self].

	1 to: entries size do: [:i |
		e := entries at: i.
		e isHighlit ifTrue: [
			e highlight: false.
			newI := i + anInteger.
			newI > entries size ifTrue: [newI := (i + 1) min: entries size].
			newI < 1 ifTrue: [newI := (i - 1) max: 1].
			self highlightAndScrollToEntry: (entries at: newI).
			^ self]].

	entries first highlight: true.
	scratchInfoClient ifNotNil: [self reportScratchProjectInfo].
