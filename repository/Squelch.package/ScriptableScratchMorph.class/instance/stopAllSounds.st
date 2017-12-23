other ops
stopAllSounds
	"Stop all sounds and MIDI notes/drums."

	| stage |
	stage := self meOrOwnerThatIsA: ScratchStageMorph.
	stage ifNotNil: [stage stopAllSounds].
