private
scrollActiveCellIntoView

	| cell page newTop |
	lastActivityIndex := lastActivityIndex min: cellMorphs size max: 1.
	cell := cellMorphs at: lastActivityIndex.
	page := scrollPane contents.
	(scrollPane bounds containsRect: cell bounds) ifFalse: [
		newTop := (scrollPane bounds center y) - (cell top - page top).
		newTop := newTop max: (scrollPane bottom - (cellMorphs last bottom - page top) - 3).
		newTop := newTop min: scrollPane top.
		page top: newTop].
