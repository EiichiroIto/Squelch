pen support
updateTrailsForm
	"Update the pen trails form using the current positions of all sprites with their pens down."
	"Details: The positions of all sprites with their pens down are recorded by my draw method. If the list from the last display update isn't empty, then trails are drawn from the old to the current positions of all such morphs on the pen trails form. The pen trails form is created on demand when the first pen is put down and removed (to save space) when the pen trails are cleared."

	| spritesToRemove m oldPoint newPoint |
	(lastPenPositions isNil or: [lastPenPositions size = 0]) ifTrue: [^ self].

	spritesToRemove := OrderedCollection new.
	lastPenPositions associationsDo: [:assoc |
		m := assoc key.
		(m penDown and: [m owner == self])
			ifTrue: [
				oldPoint := assoc value.
				newPoint := m penPosition.
				newPoint = oldPoint ifFalse: [
					self drawPenTrailFor: m from: oldPoint to: newPoint.
					assoc value: newPoint]]
			ifFalse: [spritesToRemove add: m]].

	"remove sprites that are not longer owned by me or whose pens are up"
	spritesToRemove do: [:key | lastPenPositions removeKey: key ifAbsent: []].
