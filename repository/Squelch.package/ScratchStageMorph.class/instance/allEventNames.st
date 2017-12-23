scratch processes/events
allEventNames
	"Answer a list of all events that have been defined in this project."

	| result |
	result := Set new: 100.
	self submorphsDo: [:m |
		(m isKindOf: ScriptableScratchMorph) ifTrue: [
			m addEventNamesTo: result]].
	self addEventNamesTo: result.

	scratchServer ifNotNil: [
		result addAll: scratchServer broadcastsSeen].

	"remove empty string"
	result remove: '' ifAbsent: [].

	^ result asArray sort
