motion ops
touching: anObject
	"Answer true if any visible part of me touches a visible part of the given sprite."
	"Details: Currently uses the bounding box; should follow this up with comparison of visible pixels."

	| aSpriteOrSymbol stage intersection f1 f2 map oldVis |
	aSpriteOrSymbol := self coerceSpriteArg: anObject.

	aSpriteOrSymbol = #mouse ifTrue: [
		(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ false].
		^ self containsPoint: stage adjustedCursorPoint].

	aSpriteOrSymbol = #edge ifTrue: [^ self isOnEdge].

	(aSpriteOrSymbol isKindOf: self class) ifFalse: [^ false].
	(self visible and: [aSpriteOrSymbol visible]) ifFalse: [^ false].
	intersection := self bounds intersect: aSpriteOrSymbol bounds.
	(intersection width > 0 and: [intersection height > 0]) ifFalse: [^ false].

	f1 := Form extent: intersection extent depth: 2.
	f2 := f1 deepCopy.
	oldVis := self visibility. self visibility: 100.
	self drawOn: ((FormCanvas on: f1) copyOffset: intersection topLeft negated).
	self visibility: oldVis.

	oldVis := aSpriteOrSymbol visibility. aSpriteOrSymbol visibility: 100.	
	aSpriteOrSymbol drawOn: ((FormCanvas on: f2) copyOffset: intersection topLeft negated).
	aSpriteOrSymbol visibility: oldVis.

	map := Bitmap new: 4 withAll: 1.
	map at: 1 put: 0.  "transparent"
	f1 copyBits: f1 boundingBox from: f1 at: 0@0 colorMap: map.	"make mask with 0 where transparent, 1 elsewhere"
	f2 copyBits: f2 boundingBox from: f2 at: 0@0 colorMap: map.	"ditto for other sprite image"
	f2 displayOn: f1 at: 0@0 rule: Form and.						"and the masks together"

	^ (f1 tallyPixelValues at: 1) < (f1 width * f1 height)			"are any pixels of the result non-zero?"
