motion ops
pointTowards: anObject
	"Point toward the given sprite."

	| aSpriteOrSymbol p |
	aSpriteOrSymbol := self coerceSpriteArg: anObject.

	aSpriteOrSymbol = #mouse ifTrue: [^ self pointToX: self mouseX y: self mouseY].
	(aSpriteOrSymbol isKindOf: self class) ifFalse: [^ self].
	p := aSpriteOrSymbol referencePosition.
	self pointToX: p x y: p y.

