event handling
transformFrom: uberMorph
	"Return a transform to map coorinates of uberMorph, a morph above me in my owner chain, into the coordinates of my submorphs."

	| transform |
	self isQuarterSize ifFalse: [^ super transformFrom: uberMorph].

	transform := MorphicTransform offset: (self position // -2) angle: 0.0 scale: 0.5.
	owner == uberMorph ifTrue: [^ transform].
	owner ifNil: [^ transform].
	^ (owner transformFrom: uberMorph) composedWith: transform

