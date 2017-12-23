motion ops
isOnEdge
	"Answer true if I'm touching the edge of my owner."

	owner ifNil: [^ false].
	^ (owner bounds containsRect: self bounds) not

