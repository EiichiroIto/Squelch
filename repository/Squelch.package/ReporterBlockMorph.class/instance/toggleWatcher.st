watcher
toggleWatcher
	"Toggle between hiding and showing a watcher for this block."

	| frame w palette |
	(frame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self].
	(w := frame watcherForBlock: self)
		ifNil: [frame showWatcher: self createWatcher]
		ifNotNil: [w delete].
			
	palette := self meOrOwnerThatIsA: ScratchBlockPaletteMorph.
	palette ifNotNil: [palette updateWatcherButtonsForFrame: frame].
