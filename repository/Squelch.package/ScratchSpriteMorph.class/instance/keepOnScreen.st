private
keepOnScreen
	"Make me stick to edge of my owner."

	| edgeBox |
	owner ifNil: [^ self].
	(owner bounds containsRect: bounds) ifTrue: [^ self].  "entirely on screen"
	edgeBox := owner bounds insetBy: (18 min: (bounds width min: bounds height) // 2).
	(bounds intersects: edgeBox) ifTrue: [^ self].
	self right < edgeBox left ifTrue: [self right: edgeBox left].
	self left > edgeBox right ifTrue: [self left: edgeBox right].
	self bottom < edgeBox top ifTrue: [self bottom: edgeBox top].
	self top > edgeBox bottom ifTrue: [self top: edgeBox bottom].
