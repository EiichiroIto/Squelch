event handling
mouseHold: evt

	(target isKindOf: ScratchStageMorph) ifFalse: [self rightButtonMenu].
