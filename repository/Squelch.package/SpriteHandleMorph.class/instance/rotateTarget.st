sprite handling
rotateTarget

	reversed
		ifTrue: [target rotationDegrees: (self center - self targetBounds center) 
			theta radiansToDegrees rounded + 180 ]
		ifFalse: [target rotationDegrees: (self center - self targetBounds center) 
			theta radiansToDegrees rounded ]