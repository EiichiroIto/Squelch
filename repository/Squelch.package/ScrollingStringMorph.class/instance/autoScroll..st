event handling
autoScroll: mouseY
	"Autoscroll if necessary for the given mouse y position."

	| maxScroll |
	(mouseY between: self top + 3 and: self bottom - 3) ifTrue: [^ self].

	maxScroll := (lines size - (self visibleLineCount // 3)) max: 1.
	mouseY < (self top + 3) ifTrue: [firstVisibleLine := (firstVisibleLine - 1) max: 1].
	mouseY > (self bottom - 3) ifTrue: [firstVisibleLine := (firstVisibleLine + 1) min: maxScroll].
	self updateScrollbar.
	Delay waitMSecs: 10.
