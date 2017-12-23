dropping/grabbing
wantsDroppedMorph: aMorph event: evt
	"Answer true if the given morph is a script, costume, sound or comment."

	^ (aMorph isKindOf: BlockMorph) or: [
		(aMorph isKindOf: MediaItemMorph) or: [
			aMorph isKindOf: ScratchCommentMorph]]
