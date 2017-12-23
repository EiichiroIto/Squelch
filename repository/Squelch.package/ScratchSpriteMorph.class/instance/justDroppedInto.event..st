event handling
justDroppedInto: newOwner event: evt
	
	super justDroppedInto: newOwner event: evt.
	(newOwner isKindOf: ScratchStageMorph) ifTrue: [self positionTalkBubble].
