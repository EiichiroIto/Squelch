all
baselineYForLineCounts: pixCountArray
	"Answer the baseline y from the given array of (<y>, <pixCount>) pairs for a given line."
	"Details: The first character in the line should be the marker character (a period). The baseline is the bottom of the marker character. So first we scan horizontally to isolate the maker, then we scan up to find its bottom."

	| lineForm tallies bgPix h x markStart markEnd mForm w y |
	lineForm := strikeForm copy: (0@pixCountArray first first corner: strikeForm width@(pixCountArray last first + 1)).

	self assert: [lineForm depth = 1].
	tallies := Bitmap new: (1 bitShift: lineForm depth).
	bgPix := 1.  "white pixel value"
	h := lineForm height.

	"find the start of the mark"
	x := 0.
	markStart := markEnd := nil.
	[markEnd isNil] whileTrue: [
		tallies atAllPut: 0.
		lineForm tallyPixelValuesInRect: (x@0 extent: 1@h) into: tallies.
		markStart
			ifNil: [(tallies at: bgPix) < h ifTrue: [markStart := x]]
			ifNotNil: [(tallies at: bgPix) = h ifTrue: [markEnd := x]].
		x := x + 1].

	mForm := lineForm copy: (markStart@0 corner: markEnd@h).  "marker form"
	"find the bottom of the mark"
	w := mForm width.
	y := h - 1.
	[y > 0] whileTrue: [
		tallies atAllPut: 0.
		mForm tallyPixelValuesInRect: (0@y extent: w@1) into: tallies.
		(tallies at: bgPix) < w ifTrue: [^ pixCountArray first first + y].
		y := y - 1].

	^ pixCountArray first first
