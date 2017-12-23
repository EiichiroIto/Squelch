motion ops
forward: distance
	"Move the object forward (i.e., the direction of its heading) by the given distance.
	Avoid infinite or NaN coordinates"

	| radians deltaP newPos newX newY |
	radians := rotationDegrees degreesToRadians.
	deltaP := ((radians cos)@(radians sin)) * distance.
	newPos := self position + deltaP.
	newX := newPos x.
	newY := newPos y.
	newX isNaN ifTrue: [newX := 0].
	newX isInfinite ifTrue: [newX := newX sign * 10000].
	newY isNaN ifTrue: [newY := 0].
	newY isInfinite ifTrue: [newY := newY sign * 10000].
	self position: newX @ newY.
	self keepOnScreen.
