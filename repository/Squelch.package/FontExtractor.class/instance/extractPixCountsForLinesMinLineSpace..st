all
extractPixCountsForLinesMinLineSpace: lineGap
	"Answer an array line arrays. Each line array is a sequence of (y, pixCount) pairs for one pixel row within the line of characters. There must be at least lineGap blank pixels rows between lines; we need to tolerate a certain amount of vertical gap because in larger fonts there is often a gap between the tops of accented capital letters and their accent marks."

	| w h tallies lines inRun pixCount thisLine endOfLastLine |
	w := strikeForm width.
	h := strikeForm height.
	tallies := Bitmap new: 2.
	lines := OrderedCollection new.
	endOfLastLine := -100.
	inRun := false.
	0 to: h - 1 do: [:y |
		tallies at: 2 put: 0.
		strikeForm tallyPixelValuesInRect: (0@y extent: w@1) into: tallies.
		pixCount := tallies at: 2.
		inRun ifFalse: [
			pixCount > 0 ifTrue: [
				(y - endOfLastLine) < lineGap
					ifTrue: [thisLine := lines removeLast asOrderedCollection]
					ifFalse: [thisLine := OrderedCollection new].
				inRun := true]].
		inRun ifTrue: [
				pixCount = 0
					ifTrue: [
						endOfLastLine := y.
						lines addLast: thisLine asArray.
						inRun := false]
					ifFalse: [
						thisLine addLast: (Array with: y with: pixCount)]]].

	inRun ifTrue: [self error: 'final line must be all white space'].

	^ lines asArray
