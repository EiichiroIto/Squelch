motion ops
distanceTo: anObject
	"Answer the distance to the given sprite."

	| aSpriteOrSymbol |
	aSpriteOrSymbol := self coerceSpriteArg: anObject.

	aSpriteOrSymbol = #mouse ifTrue: [
		^ ((self mouseX @ self mouseY)  - self referencePosition) r].

	(aSpriteOrSymbol isKindOf: self class) ifFalse: [^ 10000].
	^ (aSpriteOrSymbol referencePosition - self referencePosition) r
