A scrollable, ordered list of editable strings.

The following are top-level submorphs:
	titleMorph
	addItemMorph
	resizeMorph
	countMorph
	scrollPane

These morphs appear inside the scroll pane:
	emptyMorph -- added/removed to indicate when list is empty
	numberMorphs -- cell numbers (indices)
	cellMorphs -- list of cells

Each cell consists of a frame containing a line-wrapping string morph.

