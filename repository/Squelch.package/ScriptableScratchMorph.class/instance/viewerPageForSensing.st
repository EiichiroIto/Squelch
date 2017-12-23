blocks
viewerPageForSensing
	"Answer a morph containing mtion blocks for the given category for use in the given ScratchViewer."

	| bin x y |
	bin := ScratchBlockPaletteMorph new.
	x := 12.
	y := 10.
	(self blocksFor: 'sensing') do: [:blockOrSym |
		(blockOrSym = #-) | (blockOrSym = #~)
			ifTrue: [
				(blockOrSym = #-) ifTrue:[y := y + 15]. "insert a full space"
				(blockOrSym = #~) ifTrue: [
					y := y + 7.
					bin addMorph: ((ImageMorph new form: (ScratchFrameMorph skinAt: #connector)) position: x@y).
					y := y + 20]]
			ifFalse: [
				y := self createBlock: blockOrSym atPosition: x@y onPage: bin]].

	^ bin
