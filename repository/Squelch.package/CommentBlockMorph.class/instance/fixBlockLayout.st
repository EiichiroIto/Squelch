layout
fixBlockLayout
	"Update the positions of my submorphs."

	| nextB tabInset xOffset |
	blockLayoutNeeded ifFalse: [^ self].
	super fixBlockLayout.

	tabInset := 10.
	xOffset := tabInset + ((self width - tabInset - labelMorph width) // 2).
	labelMorph position: self position + (xOffset@2).

	commentMorph owner = self
		ifTrue: [
			self extent: commentMorph extent + (10@26).
			showHideMorph position: labelMorph topRight + (4@4).
			commentMorph position: self position + (5@16)]
		ifFalse: [
			self height: 22.
			showHideMorph position: labelMorph topRight + (5@3)].

	(nextB := self nextBlock) ifNotNil: [
		nextB position: self left@(self bottom - 4).
		nextB fixBlockLayout].
