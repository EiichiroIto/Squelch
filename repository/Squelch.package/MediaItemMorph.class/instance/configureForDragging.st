initialization
configureForDragging
	"Rebuild my submorphs to make a draggable version of me."
	"MediaItemMorph open configureForDragging"

	self removeAllMorphs.

	thumbnailMorph position: self position + highlightPadding.
	self addMorph: thumbnailMorph.

	highlightMorph position: self position.
	self addMorphBack: highlightMorph.

	self color: Color transparent.
	self extent: highlightMorph extent.
