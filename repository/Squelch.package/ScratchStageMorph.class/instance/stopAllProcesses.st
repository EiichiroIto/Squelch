scratch processes/events
stopAllProcesses
	"Stop all running Scratch processes."

	| allObjs |
	"clear all processes, including those with error feedback"
	allObjs := submorphs select: [:m | m isKindOf: ScriptableScratchMorph].
	allObjs := allObjs copyWith: self.
	allObjs do: [:obj |
		(obj blocksBin isKindOf: Morph) ifTrue: [
			obj blocksBin submorphs do: [:b |
				(b isKindOf: BlockMorph) ifTrue: [b clearProcess]]]].

	runningBlocks := OrderedCollection new.
	inProcessStep := false.
