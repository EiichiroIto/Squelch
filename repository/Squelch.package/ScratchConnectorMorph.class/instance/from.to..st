as yet unclassified
from: p1 to: p2

	| left right top bottom |
	((point1 = p1) & (point2 = p2)) ifTrue: [^ self].

	point1 := p1.
	point2 := p2.

	left := point1 x min: point2 x.
	right := point1 x max: point2 x.
	top := point1 y min: point2 y.
	bottom := point1 y max: point2 y.

	self position: left @ top.
	self extent: ((right - left) @ ((bottom - top) max: 1)).

