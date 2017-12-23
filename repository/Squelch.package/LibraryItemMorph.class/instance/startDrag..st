event handling
startDrag: evt

	(self target isKindOf: ScratchStageMorph) ifTrue: [^ self]. "cannot drag stage thumbnail"

	(self meOrOwnerThatIsA: ScratchLibraryMorph)
		ifNil: [evt hand grabMorph: self]
		ifNotNil: [evt hand attachMorph: self fullCopy].
