stepping
step
	"Optimization: Don't update unless the costume has changed."

	| delta |
	((target respondsTo: #rotationDegrees) and:
	 [lastRotationDegrees ~= target rotationDegrees]) ifTrue: [
		self changed.  "update the direction marker"
		lastRotationDegrees := target rotationDegrees].

	(target notNil and:
	 [lastUpdateMSecs = target costumeChangeMSecs])
		ifTrue: [^ self].

	delta := Time millisecondClockValue - lastUpdateMSecs.
	(delta < 0) | (delta > 100) ifTrue: [self updateThumbnail].
