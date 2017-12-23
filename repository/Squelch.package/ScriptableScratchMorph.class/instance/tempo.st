sound ops
tempo

	| stage |
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ 60].
	^ stage tempo
