scratch processes/events
broadcastEventNamed: name with: value
	"Broadcast a ScratchEvent with given name and argument value to all Scratch objects and answer a collection of the newly created processes. This is done by finding all public scripts that respond to this event, and starting new processes for any not already running."

	| event objList newProcs |
	scratchServer ifNotNil: [scratchServer queueBroadcast: name].
	event := ScratchEvent new name: name argument: value.
	newProcs := OrderedCollection new.

	"start scripts"
	objList := submorphs select: [:m | m isKindOf: ScriptableScratchMorph].
	objList do: [:obj |
		newProcs addAll: (obj eventReceived: event)].
	newProcs addAll: (self eventReceived: event).

	^ newProcs asArray
