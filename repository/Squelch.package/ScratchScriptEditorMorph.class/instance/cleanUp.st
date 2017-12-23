menu/button ops
cleanUp
	"Align all scripts vertically in alphabetical order"

	| scriptsMorph |
	scriptsMorph := (pageViewerMorph allMorphs select: [:c | c isKindOf: ScratchScriptsMorph]) first.
	scriptsMorph cleanUp.
	pageViewerMorph
		updateContentsExtent;
		updateScrollbars.

