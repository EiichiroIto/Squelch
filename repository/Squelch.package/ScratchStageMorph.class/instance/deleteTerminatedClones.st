clones
deleteTerminatedClones
	"Delete all clones that have no running scripts."

	| isRunning |
	self allClones do: [:clone |
		isRunning := false.
		clone blocksBin allMorphsDo: [:b |
			((b isKindOf: BlockMorph) and: [b hasRunningProcess])
				ifTrue: [isRunning := true]].
		isRunning ifFalse: [clone delete]].
