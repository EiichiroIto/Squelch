event handling
mouseMove: evt

	| dist tc |
	offset ifNil: [^self].

	#resize = type 
		ifTrue: [
			dist := evt hand cursorPoint x - offset - self left.
			reversed
				ifTrue: [((dist negative & self atMax) | 
					(dist negative not & self atMin)) ifTrue: [^self ]]
				ifFalse: [((dist negative & self atMin) | 
					(dist negative not & self atMax)) ifTrue: [^self ]].
			^self 
				left: self left + dist;
				resizeTarget ].

	tc := self targetBounds center.
	self 
		center: (tc + (Point r: offset degrees: (evt cursorPoint - tc)
			 theta radiansToDegrees rounded));
		rotateTarget


