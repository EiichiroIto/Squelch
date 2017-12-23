scratch processes/events
processesToRun
	"Answer a collection of processes to run. Filter out any processes for objects have been picked up. Always return a copy of the processes list."

	| result m |
	result := runningBlocks collect: [:b | b scratchProc].
	result := result select: [:proc | proc notNil].

	World activeHand submorphs size > 0 ifTrue: [
		m := World activeHand submorphs first.
		result := result select: [:proc | (proc includesReceiver: m) not]].

	^ result
 