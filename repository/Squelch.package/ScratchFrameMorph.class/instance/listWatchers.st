watchers
listWatchers
	"Answer a collection of all the list watchers in the work pane."

	^ self workPane submorphs select: [:m | m isKindOf: ScratchListMorph]
