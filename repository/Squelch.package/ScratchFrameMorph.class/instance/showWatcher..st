watchers
showWatcher: watcher
	"Show the given watcher. Reuse it's old position if it was showing before. Otherwise, find a new position for it."

	| rec style range |
	rec := watcherPositions
		at: {watcher getAssociatedSprite. watcher selectorAndArg}
		ifAbsent: [nil].
	rec
		ifNil: [
			watcher position: self unusedPositionForWatcher.
			style := #small.
			range := watcher sliderRange]
		ifNotNil: [
			watcher position: workPane position + rec second.
			style := rec third.
			range := rec fourth].

	watcherPositions
		at: {watcher getAssociatedSprite. watcher selectorAndArg}
		put: {watcher. (watcher position - workPane position). style. range}.

	watcher sliderRange: range.
	watcher layoutStyle: style.
	watcher updateTargetName.
	workPane addMorph: watcher.
	watcher world ifNotNil: [watcher world startSteppingSubmorphsOf: watcher].

