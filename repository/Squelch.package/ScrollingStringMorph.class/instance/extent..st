menu
extent: aPoint
	"Adjust the position and size of my scrollbar and compute visibleWidth. Text layout is handled by my step method."

	super extent: (aPoint max: 120@75).
	backForm
		ifNotNil: [scrollbar position: (self right - borderWidth - scrollbar width - 7)@(self top + borderWidth + 8).
			scrollbar height: self height - (2 * borderWidth) - 14]
		ifNil: [scrollbar position: (self right - borderWidth - scrollbar width - 3)@(self top + borderWidth + 1).
			scrollbar height: self height - (2 * borderWidth)].

	visibleWidth := self width - (2 * self textInset x) - 1.
	scrollbar owner = self ifTrue: [visibleWidth := visibleWidth - scrollbar width].

	layoutNeeded := true.
