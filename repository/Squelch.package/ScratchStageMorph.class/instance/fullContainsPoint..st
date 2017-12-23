event handling
fullContainsPoint: aPoint
	"Answer true if the given point is in my visible bounds. In quarterSize mode, my visible bounds is only half of my extent."

	| r |
	r := self isQuarterSize
		ifTrue: [self position extent: bounds extent // 2]
		ifFalse: [bounds].

	^ r containsPoint: aPoint
