watchers
deletingWatcher
	"The given watcher is being removed from the stage; remember it's last position."

	| palette w |
	watcherPositions do: [:rec |
		rec first ifNotNil: [
			w := rec first.
			w owner ifNil: [
				rec at: 1 put: nil.
				rec at: 2 put: w position - workPane position. "record old position and layout style"
				rec at: 3 put: w layoutStyle.
				rec at: 4 put: w sliderRange]]].

	palette := viewerPane pageViewer contents.
	palette ifNotNil: [palette updateWatcherButtonsForFrame: self].
