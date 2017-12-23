private
updatePosition

	| vOffset |
	anchor ifNil: [^ self].

	vOffset := (anchor isKindOf: HatBlockMorph) ifTrue: [19] ifFalse: [3].
	ScratchTranslator isRTL
		ifTrue: [self position: (anchor left - self width - anchorOffset) @ (anchor top + vOffset)]
		ifFalse: [self position: (anchor right + anchorOffset) @ (anchor top + vOffset)].

	self refreshConnector.
	oldAnchorPos := anchor position.
