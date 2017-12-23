all
markAfter: startX in: lineForm
	"Answer a pair containing the starting and ending x positions of the next mark after the given x offset in the given Form. Answer nil if there are no more marks. A mark is a contiguous horizontal region of the given Form containing non-background-color pixels."
	"Note: The top-left pixel of the given form is assumed to be of the background color."

	| w h tallies bgPix markStart x |
	w := lineForm width.
	h := lineForm height.
	startX > w ifTrue: [^ nil].  "past end"

	self assert: [lineForm depth <= 16].
	tallies := Bitmap new: (1 bitShift: lineForm depth).
	bgPix := (lineForm pixelValueAt: 0@0) + 1.  "pixel value of the background color"

	"find the start of the mark"
	markStart := nil.
	x := startX.
	[markStart isNil and: [x < w]] whileTrue: [
		tallies atAllPut: 0.
		lineForm tallyPixelValuesInRect: (x@0 extent: 1@h) into: tallies.
		(tallies at: bgPix) < h ifTrue: [markStart := x].
		x := x + 1].

	markStart ifNil: [^ nil].  "no more marks"

	"find the end of the mark"
	[x < w] whileTrue: [
		tallies atAllPut: 0.
		lineForm tallyPixelValuesInRect: (x@0 extent: 1@h) into: tallies.
		(tallies at: bgPix) = h ifTrue: [^ Array with: markStart with: x].
		x := x + 1].

	^ Array with: markStart with: w  "mark went to end of line"
