blocks
viewerPageForCategory: aCategoryName
	"Answer a morph containing blocks for the given category for use in the given ScratchViewer."

	| bin x y |
	aCategoryName = 'variables' ifTrue: [^ self variablesPage].
	aCategoryName = 'motion' ifTrue: [^ self viewerPageForMotion].
	aCategoryName = 'sensing' ifTrue: [^ self viewerPageForSensing].

	bin := ScratchBlockPaletteMorph new.
	x := 12.
	y := 10.
	(self blocksFor: aCategoryName) do: [:blockOrSym |
		(blockOrSym = #-) | (blockOrSym = #~)
			ifTrue: [
				(blockOrSym = #-) ifTrue: [y := y + 15].  "insert a full space"
				(blockOrSym = #~) ifTrue: [y := y + 5]]  "insert a half space"
			ifFalse: [
				y := self createBlock: blockOrSym atPosition: x@y onPage: bin]].

	^ bin
