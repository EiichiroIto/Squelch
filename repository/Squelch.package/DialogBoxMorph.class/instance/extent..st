geometry
extent: aPoint
	
	| w |
	(self isKindOf: PaintFrame) ifTrue: [^ super extent: aPoint].
	self fixLayoutForExtent: aPoint.
	super extent: self fullBounds extent.
	w := self world.
	w ifNotNil: [self position: w center - (self extent // 2)].  "center on screen"
