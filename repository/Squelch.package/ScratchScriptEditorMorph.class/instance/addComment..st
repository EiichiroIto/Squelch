menu/button ops
addComment: aPosition

	| c scriptsMorph |
	scriptsMorph := (pageViewerMorph allMorphs select: [: m | m isKindOf: ScratchScriptsMorph]) first.
	scriptsMorph addMorph: (c := ScratchCommentMorph new position: aPosition).
	World activeHand newKeyboardFocus: c commentMorph.
