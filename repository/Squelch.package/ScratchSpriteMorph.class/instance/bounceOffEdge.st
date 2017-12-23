motion ops
bounceOffEdge
	"Set my direction to bounce off the edge."

	| myBox edgeBox dirX dirY |
	owner ifNil: [^ self].
	myBox := self fullBounds.
	edgeBox := owner bounds.
	(edgeBox containsRect: myBox) ifTrue: [^ self].

	dirX := self rotationDegrees degreesToRadians cos.
	dirY := self rotationDegrees degreesToRadians sin negated.
	myBox left < edgeBox left ifTrue: [dirX := dirX abs].
	myBox right > edgeBox right ifTrue: [dirX := dirX abs negated].
	myBox top < edgeBox top ifTrue: [dirY := dirY abs negated].
	myBox bottom > edgeBox bottom ifTrue: [dirY := dirY abs].
	self rotationDegrees: (dirY negated asFloat arcTan: dirX) radiansToDegrees.
	self position: self position + (myBox amountToTranslateWithin: edgeBox).
