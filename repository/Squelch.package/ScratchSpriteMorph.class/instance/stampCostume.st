pen ops
stampCostume
	"Stamp a copy of my current costume on the pen trails layer."

	| m |
	self step.  "update costume if necessary"
	(m := self meOrOwnerThatIsA: ScratchStageMorph)
		ifNotNil: [m stampCostume: self].
