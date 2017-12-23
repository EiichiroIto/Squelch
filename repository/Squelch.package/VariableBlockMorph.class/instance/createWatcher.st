watcher
createWatcher
	"Return a new watcher for me."

	| newWatcher |
	newWatcher := WatcherMorph new setCategoryColor: self color.
	newWatcher target: receiver selector: #getVar: parameter: commandSpec.

	^ newWatcher
