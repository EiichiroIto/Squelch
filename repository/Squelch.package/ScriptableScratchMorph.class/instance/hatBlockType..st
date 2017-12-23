blocks
hatBlockType: blockType

	| stage evtName |
	'E' = blockType ifTrue: [
		evtName := ''.
		(stage := self meOrOwnerThatIsA: ScratchStageMorph)
			ifNotNil: [evtName := stage defaultEventName].
		^ EventHatMorph new scriptOwner: self; eventName: evtName].

	'K' = blockType ifTrue: [^ KeyEventHatMorph new scriptOwner: self].
	'M' = blockType ifTrue: [^ MouseClickEventHatMorph new scriptOwner: self].
	'S' = blockType ifTrue: [^ EventHatMorph new forStartEvent scriptOwner: self].
	'W' = blockType ifTrue: [^ WhenHatBlockMorph new scriptOwner: self].
