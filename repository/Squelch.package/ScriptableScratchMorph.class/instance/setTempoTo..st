sound ops
setTempoTo: aNumber

	| stage |
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ self].
	stage setTempoTo: aNumber.
