private
ensureCursorIsOnScreen

	| visibleLines i |
	visibleLines := self visibleLineCount.
	visibleLines >= lines size ifTrue: [^ self updateScrollbar].

	i := (self lineAndIndexFor: selectionStart) first.
	(i between: firstVisibleLine and: firstVisibleLine + visibleLines - 2) ifTrue: [
		^ self updateScrollbar].

	i < firstVisibleLine
		ifTrue: [firstVisibleLine := (i - 2) max: 1]
		ifFalse: [firstVisibleLine := (i + 1 - visibleLines) max: 1].

	self updateScrollbar.
	self changed.

