looks ops
layer: aNumber

	| n submorphsMinusMe newSubmorphs |
	owner ifNil: [^ 1].
	n := (aNumber rounded max: 1) min: owner submorphCount.
	submorphsMinusMe := owner submorphs copyWithout: self.
	newSubmorphs :=
		(submorphsMinusMe copyFrom: 1 to: (n - 1 min: submorphsMinusMe size)),
		(Array with: self),
		(submorphsMinusMe copyFrom: n to: submorphsMinusMe size).
	owner privateSubmorphs: newSubmorphs.
	self changed.
