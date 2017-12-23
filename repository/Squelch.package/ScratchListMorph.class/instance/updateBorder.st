stepping
updateBorder

	lastActivityError
		ifTrue: [self borderColor: Color red]
		ifFalse: [self borderColor: self normalBorderColor].
	lastActivityError := false.
