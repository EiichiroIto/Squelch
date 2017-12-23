all
extractPixCountsForLines
	"Answer an array line arrays. Each line array is a sequence of (y, pixCount) pairs for one pixel row within the line of characters."
	"Details: Try extracting lines with different inter-line gaps until we get the expected 15 lines."

	| lines |
	2 to: 25 do: [:gap |
		lines := self extractPixCountsForLinesMinLineSpace: gap.
		lines size = 15 ifTrue: [^ lines]].
	self error: 'Could not extract lines'
