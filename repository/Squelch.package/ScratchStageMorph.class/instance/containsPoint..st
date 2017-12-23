event handling
containsPoint: aPoint

	self isQuarterSize ifTrue: [^ (self position extent: self extent // 2)  containsPoint: aPoint].
	^ self bounds containsPoint: aPoint
