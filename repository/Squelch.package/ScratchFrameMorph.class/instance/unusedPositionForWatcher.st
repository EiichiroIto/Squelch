watchers
unusedPositionForWatcher
	"Return an unused watcher position on the stage."

	| watchers positions rowH x y newX |
	watchers := (watcherPositions values collect: [:r | r first]) select: [:w | w notNil].
	positions := watchers collect: [:w | w position].

	(watchers size > 0)
		ifTrue: [rowH := (watchers at: 1) height]
		ifFalse: [rowH := 25].
	x := workPane left + 10.
	y := workPane top + 10.
	[positions includes: (x@y)] whileTrue: [
		y := y + rowH.
		(y > (workPane bottom - rowH)) ifTrue: [  "start a new column"
			newX := 0.
			watchers do: [:w |
				w left < (x + 20) ifTrue: [newX := newX max: w right + 4]].
			newX > (workPane right - 20) ifTrue: [
				^ ((10 to: 400) atRandom) @ ((10 to: 330) atRandom)].  "no free location"
			x := newX.
			y := workPane top + 10]].

	^ x@y
