private
updateContents
	"Update and layout my contents."

	| page numberRight cellWidth inset x y |
	cellMorphs size = 0 ifTrue: [^ self showEmpty].
	emptyMorph delete.

	page := scrollPane contents.
	page changed.

	ScratchTranslator isRTL
		ifTrue: [numberRight := self right - 5]
		ifFalse: [numberRight := self left + self largestIndexWidth + 6].

	"word-wrap cell contents and fix cell extents, if needed"
	ScratchTranslator isRTL
		ifTrue: [cellWidth := self right - self left - self largestIndexWidth - 33]
		ifFalse: [cellWidth := self right - numberRight - 25].
	inset := 3.
	cellMorphs do: [:cell |
		((cell width ~= cellWidth) or: [cell extent ~= (cell firstSubmorph extent + inset)]) ifTrue: [
		cell firstSubmorph width: cellWidth - inset.
		cell extent: cell firstSubmorph extent + inset]].

	"position cells"
	ScratchTranslator isRTL
		ifTrue: [x := self left + 26]
		ifFalse: [x := numberRight + 4].
	y := page top + 3.
	cellMorphs do: [:cell |
		cell position: x@y.
		y := y + cell height - 1].

	self updateIndices: numberRight.

	page extent: (self width - (2 * borderWidth)) @ (y + 3).

	lastActivityIndex ifNotNil: [
 		(lastActivityIndex between: 1 and: cellMorphs size) ifTrue: [
			(numberMorphs at: lastActivityIndex) color: (Color white).
			highlightActive := true].
		self scrollActiveCellIntoView.
		lastActivityIndex := nil].
	scrollPane updateScrollbars.
	scrollPane updateScrollbars.

	listLayoutNeeded := false.
