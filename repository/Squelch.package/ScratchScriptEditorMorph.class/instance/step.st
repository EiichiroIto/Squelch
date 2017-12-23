stepping
step

	currentCategory = 'Costumes' ifTrue: [self updateCostumeSelection].

	(penReadout isNil or: [penReadout owner ~= self]) ifTrue: [^ self].
	self target penDown
		ifTrue: [penReadout color: self target penColor]
		ifFalse: [penReadout color: Color transparent].
