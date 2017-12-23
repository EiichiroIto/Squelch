pen ops
penDown: aBoolean

	| m |
	penDown := aBoolean.
	penColor ifNil: [penColor := Color black].  "initialize if necessary"
	penSize ifNil: [penSize := 1].  "initialize if necessary"

	(m := self meOrOwnerThatIsA: ScratchStageMorph)
		ifNotNil: [m penUpOrDownChangeFor: self].
