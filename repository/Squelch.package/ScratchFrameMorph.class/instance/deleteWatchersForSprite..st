watchers
deleteWatchersForSprite: aSprite
	"The given sprite is being deleted. Delete all watchers associated with it."

	aSprite lists do: [:m | m delete].

	workPane submorphsDo: [:m |
		(m isKindOf: WatcherMorph) ifTrue: [
			(m target = aSprite) ifTrue: [m delete]]].

	watcherPositions keys do: [:k | 
		(k at: 1) = aSprite ifTrue: [watcherPositions removeKey: k]].
