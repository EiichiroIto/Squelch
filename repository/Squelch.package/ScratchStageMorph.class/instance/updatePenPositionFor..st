pen support
updatePenPositionFor: aSprite
	"Update the given sprites pen position if necessary. Used to avoid drawing glitches when going between normal and presentation mode."

	lastPenPositions ifNil: [^ self].  "no pens are down"
	(lastPenPositions includes: aSprite) ifTrue: [
		lastPenPositions at: aSprite put: aSprite penPosition].
