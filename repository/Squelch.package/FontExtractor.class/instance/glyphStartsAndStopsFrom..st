all
glyphStartsAndStopsFrom: lineForm
	"Answer an array of (startX, endX) runs for the glyphs in the given Form."

	| w h tallies runs endOfLastGlyph inRun pixCount thisRun |
	w := lineForm width.
	h := lineForm height.
	tallies := Bitmap new: 2.
	runs := OrderedCollection new.
	endOfLastGlyph := -100.
	inRun := false.
	0 to: w - 1 do: [:x |
		tallies at: 2 put: 0.
		lineForm tallyPixelValuesInRect: (x@0 extent: 1@h) into: tallies.
		pixCount := tallies at: 2.
		(inRun not and: [pixCount > 0]) ifTrue: [ "start a new run or extend the last run"
			(x - endOfLastGlyph) <= spaceWidth  "some chars, such as double-quote, include a gap of a few pixels"
				ifTrue: [thisRun := runs removeLast]  "extend the last run"
				ifFalse: [thisRun := Array with: x with: 0].
			inRun := true].
		(inRun and: [pixCount = 0]) ifTrue: [  "end the current run"
			thisRun at: 2 put: x - 1.
			endOfLastGlyph := x - 1.
			runs addLast: thisRun.
			inRun := false]].

	inRun ifTrue: [self error: 'line must end with white space'].

	^ runs asArray
