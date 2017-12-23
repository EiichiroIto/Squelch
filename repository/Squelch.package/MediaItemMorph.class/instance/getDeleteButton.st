initialization
getDeleteButton

	| b |
	b := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #deleteCircleButtonPressed)
		offForm: (ScratchFrameMorph skinAt: #deleteCircleButton).
	b
		actionSelector: #deleteMedia;
		toggleMode: false.

	media isImage ifTrue: [(scratchObj isKindOf: ScratchStageMorph)
		ifTrue: [b setBalloonText: 'Delete this background' localized]
		ifFalse: [b setBalloonText: 'Delete this costume' localized]].
	media isSound ifTrue: [b setBalloonText: 'Delete this sound' localized].
	b target: self.
	^ b
