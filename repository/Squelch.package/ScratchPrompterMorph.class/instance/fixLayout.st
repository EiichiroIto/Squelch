geometry
fixLayout

	typeinMorph ifNil: [^ self].
	typeinMorph
		width: self width - 36;
		bottom: self bottom - 6.
	ScratchTranslator isRTL
		ifTrue:[typeinMorph right: self right - 8]
		ifFalse:[typeinMorph left: self left + 8].

	questionMorph ifNotNil: [
		ScratchTranslator isRTL
			ifTrue: [questionMorph position: self topRight - ((questionMorph width + 8)@0) + (0@5)]
			ifFalse: [questionMorph position: self position + (8@5)]].

	ScratchTranslator isRTL
		ifTrue:[okButton position: typeinMorph topLeft - ((okButton width + 2)@0)]
		ifFalse:[okButton position: typeinMorph topRight + (2@0)].
