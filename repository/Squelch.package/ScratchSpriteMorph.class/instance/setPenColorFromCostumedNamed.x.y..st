pen ops
setPenColorFromCostumedNamed: costumeNameOrIndex x: x y: y
	"Set my pen color from my costume of the given name at the given point. If the point is off the edge, set my color to black."

	| cName m f pixel |
	cName := costumeNameOrIndex.
	cName isNumber ifTrue: [cName := self costumeNameFromNumber: costumeNameOrIndex].
	m := media
		detect: [:el | el isSound not and: [el mediaName caseInsensitiveEqual: cName]]
		ifNone: [^ self].

	f := m form.
	f unhibernate.
	pixel := ScratchPlugin
		primInterpolate: f bits
		width: f width
		x: (x * 1024) rounded
		y: ((f height - y) * 1024) rounded.

	pixel = 0
		ifTrue: [self penColor: Color black]
		ifFalse: [self penColor: (Color colorFromPixelValue: pixel depth: 24)].
