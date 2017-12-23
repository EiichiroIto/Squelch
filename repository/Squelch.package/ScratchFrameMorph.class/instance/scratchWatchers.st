watchers
scratchWatchers
	"Answer a collection of all the scratch watchers in the work pane."

	^ self workPane submorphs select: [:m | m isKindOf: WatcherMorph]
