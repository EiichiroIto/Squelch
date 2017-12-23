motion ops
turnAwayFromEdge
	"Turn away from the nearest edge."

	| dirX dirY refP delta |
	dirX := self rotationDegrees degreesToRadians cos.
	dirY := self rotationDegrees degreesToRadians sin negated.
	refP := self referencePosition.
	delta := (ScratchFrameMorph workpaneExtent // 2) - refP abs.

	(delta x < delta y) | (delta x < 0) ifTrue: [  "point dirX towards center"
		dirX = 0.0 ifTrue: [dirX := 0.1].
		refP x > 0
			ifTrue: [dirX := dirX abs negated]
			ifFalse: [dirX := dirX abs]].
	(delta y < delta x) | (delta y < 0) ifTrue: [  "point dirY towards center"
		dirY = 0.0 ifTrue: [dirY := 0.1].
		refP y > 0
			ifTrue: [dirY := dirY abs negated]
			ifFalse: [dirY := dirY abs]].

	self rotationDegrees: (dirY negated asFloat arcTan: dirX) radiansToDegrees.
