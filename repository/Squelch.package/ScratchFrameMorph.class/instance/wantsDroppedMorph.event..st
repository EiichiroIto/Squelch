dropping/grabbing
wantsDroppedMorph: aMorph event: evt

	^ (aMorph isKindOf: BlockMorph) or: [
	  	(aMorph isKindOf: ScriptableScratchMorph) or: [
			(aMorph isKindOf: ScratchCommentMorph)]].
