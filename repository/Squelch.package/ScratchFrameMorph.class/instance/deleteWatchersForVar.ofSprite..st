watchers
deleteWatchersForVar: varName ofSprite: aSprite
	"The given variable is being deleted. Delete all watchers associated with it."

	workPane submorphsDo: [:m |
		(m isKindOf: WatcherMorph) ifTrue: [
			((m target = aSprite) and:
			 [(m getSelector = #getVar:) and:
			 [m parameter = varName]])
				ifTrue: [m delete]]].
