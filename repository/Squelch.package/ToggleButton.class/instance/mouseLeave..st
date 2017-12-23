event handling
mouseLeave: evt

	ScratchToolTipMorph clearToolTips.
	isDisabled ifTrue: [^ self].

	overForm ifNotNil: [
		self changed.
		isOver := false.
		isOn ifTrue: [self on] ifFalse: [self off]].
