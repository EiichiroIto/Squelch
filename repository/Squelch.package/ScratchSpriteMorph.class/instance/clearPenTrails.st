pen ops
clearPenTrails
	"Clear the pen trails layer."

	| m |
	(m := self meOrOwnerThatIsA: ScratchStageMorph)
		ifNotNil: [m clearPenTrails].
