event handling
cleanUp
	"Align all scripts vertically in alphabetical order"

	| sortedBlocks y collectedBlocks |
	collectedBlocks := OrderedCollection new.
	submorphs do: [:m | (m isKindOf: BlockMorph) ifTrue:[collectedBlocks add: m]].
	sortedBlocks := collectedBlocks copy sort: [:s1 :s2 | s1 top < s2 top].

	y := 20.
	(owner isKindOf: ScrollFrameMorph2) ifTrue: [
		owner hScrollPixels: 0.
		owner vScrollPixels: 0].
	sortedBlocks do: [:s |
		ScratchTranslator isRTL
			ifTrue: [(owner isKindOf: ScrollFrameMorph2)
				ifTrue: [s position: (owner left + owner visibleExtent x - s width - 29)@(self top + y)]
				ifFalse: [s position: (self right - s width - 20)@(self top + y)]]
			ifFalse: [s position: self position + (20@y)].
		y := y + s fullBounds height + 15].

	self layoutChanged.
