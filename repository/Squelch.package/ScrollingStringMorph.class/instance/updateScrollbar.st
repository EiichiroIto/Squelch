geometry
updateScrollbar
	"Update my scrollbar's position, percent, and deltas based on my current contents."

	| visibleLines maxScroll |
	visibleLines := self visibleLineCount.
	scrollbar percentVisible: (visibleLines asFloat / lines size).
	visibleLines >= lines size ifTrue: [
		firstVisibleLine := 1.
		self changed].

	maxScroll := (lines size - (self visibleLineCount // 3)) max: 1.
	maxScroll > 0
		ifTrue: [
			scrollbar
				scrollDelta: 1.0 / visibleLines
				pageDelta: (0.6 * visibleLines) / maxScroll.
			firstVisibleLine > maxScroll ifTrue: [firstVisibleLine := maxScroll].
			scrollbar value: (firstVisibleLine - 1) / maxScroll]
		ifFalse: [
			scrollbar value: 0].
