event handling
mouseLeave: evt

	isOn ifFalse: [ over ifNotNil: [self off] ].
	ScratchToolTipMorph clearToolTips.
