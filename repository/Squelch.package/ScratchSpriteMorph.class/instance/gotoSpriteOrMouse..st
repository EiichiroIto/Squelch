motion ops
gotoSpriteOrMouse: anObject
	"Go to the given sprite or mouse position."

	| aSpriteOrSymbol p |
	aSpriteOrSymbol := self coerceSpriteArg: anObject.

	aSpriteOrSymbol = #mouse ifTrue: [^ self gotoX: self mouseX y: self mouseY].
	(aSpriteOrSymbol isKindOf: self class) ifFalse: [^ self].
	p := aSpriteOrSymbol referencePosition.
	self gotoX: p x y: p y.

