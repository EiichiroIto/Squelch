other ops
stopAll
	"Stop everything!"

	| stage |
	stage := self meOrOwnerThatIsA: ScratchStageMorph.
	stage ifNotNil: [stage stopAll].
