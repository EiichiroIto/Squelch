menu/button ops
setRotationStyle: aSymbol

	aSymbol == #Smooth ifTrue: [self target rotationStyle: #normal].
	aSymbol == #Flip ifTrue: [self target rotationStyle: #leftRight].
	aSymbol == #None ifTrue: [self target rotationStyle: #none].
	self updateRotationButtonHighlight.

	(self target respondsTo: #rotationDegrees:) ifFalse: [^ self].
	self animateRotationStyle.

