private
layoutChanged
	"Update rotatedForm and offsetWhenRotated and compute new bounds."

	| refPoint |
	self changed.
	refPoint := bounds origin + offsetWhenRotated.
	(rotationStyle == #none and: [scalePoint = (1.0@1.0)])
		ifTrue: [  "zero rotation and scale; use original Form"
			rotatedForm := self costumeForm.
			offsetWhenRotated := costume rotationCenter]
		ifFalse: [self generateRotatedForm].	"compute the new rotatedForm and offsetWhenRotated"

	bounds := (refPoint - offsetWhenRotated) extent: rotatedForm extent.
	super layoutChanged.
	self changed.
