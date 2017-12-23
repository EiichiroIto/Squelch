watcher
createWatcher
	"Return a new watcher for me."

	| newWatcher |
	newWatcher := WatcherMorph new setCategoryColor: self color.
	self argumentCount = 1
		ifTrue: [newWatcher target: receiver selector: selector parameter: self args first]
		ifFalse: [newWatcher target: receiver selector: selector parameter: nil].

	^ newWatcher
