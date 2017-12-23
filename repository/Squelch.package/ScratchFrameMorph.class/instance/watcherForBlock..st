watchers
watcherForBlock: aBlockMorph
	"Answer a watcher for the given block if there is one currently showing on the stage."

	| pair |
	pair := watcherPositions
		at: {aBlockMorph getAssociatedSprite. aBlockMorph selectorAndArg}
		ifAbsent: [^ nil].

	^ pair first

