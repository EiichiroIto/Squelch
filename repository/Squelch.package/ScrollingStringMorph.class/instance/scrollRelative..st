accessing
scrollRelative: aFloat
	"Sent by the scrollbar. Scroll to the given relative postion between 0.0 and 1.0."

	| range |
	range := lines size - (0.25 * self visibleLineCount).
	firstVisibleLine := (aFloat * range) rounded.
	firstVisibleLine := firstVisibleLine max: 1.
	self changed.
