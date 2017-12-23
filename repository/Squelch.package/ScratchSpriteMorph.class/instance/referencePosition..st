accessing
referencePosition: aPoint
	"Set my reference position. Avoid infinite or NaN coordinates. Keep on screen."

	| newX newY p |
	newX := aPoint x.
	newX isNaN ifTrue: [newX := 0].
	newX isInfinite ifTrue: [newX := newX sign * 10000].
	newY := aPoint y.
	newY isNaN ifTrue: [newY := 0].
	newY isInfinite ifTrue: [newY := newY sign * 10000].

	p := newX @ newY negated.
	self position: ScratchOrigin + (p - offsetWhenRotated).
	self keepOnScreen.
