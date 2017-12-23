variables
addWatcherForNewVariable: varName withScope: spriteOrStage
	"Add a watcher on the stage once a variable has been created."

	| sFrame |
	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self].
	sFrame viewerPane pageViewer submorphs do: [:s | 
		(s isKindOf: ScratchBlockPaletteMorph) ifTrue: [
			s submorphs do: [:block | 
				(block isKindOf: VariableBlockMorph) ifTrue: [
					(block receiver = spriteOrStage) &
					(block commandSpec = varName) ifTrue: [
						(sFrame watcherForBlock: block) ifNil: [
							block toggleWatcher]]]]]].
