pen support
penUpOrDownChangeFor: aSprite
	"The pen up/down state for the given sprite may have changed; update lastPenPositions accordingly."

	| p |
	aSprite penDown
		ifTrue: [  "pen down transition"
			lastPenPositions ifNil: [lastPenPositions := IdentityDictionary new].
			p := aSprite penPosition.
			lastPenPositions at: aSprite put: p.
			self drawPenTrailFor: aSprite from: p to: p]
		ifFalse: [
			lastPenPositions ifNil: [^ self].
			lastPenPositions removeKey: aSprite ifAbsent: [].
			lastPenPositions size = 0 ifTrue: [lastPenPositions := nil]].
