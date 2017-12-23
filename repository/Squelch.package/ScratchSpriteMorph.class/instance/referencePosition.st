accessing
referencePosition

	| p s |
	p := (bounds origin + offsetWhenRotated) - ScratchOrigin.

	"adjust when in Hand in quartersize mode:"
	((owner isKindOf: HandMorph) and:
	 [((s := owner formerOwner) isKindOf: ScratchStageMorph) and:
	 [s isQuarterSize]]) ifTrue: [
		"Note: this is not quite right when rotation center is offset"
		p := (p * 2) + (240@180)].

	^ p x @ p y negated
