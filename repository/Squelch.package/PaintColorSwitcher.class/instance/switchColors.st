accessing
switchColors

	| storedColor |
	storedColor := foreground color.
	self owner color1: background color.
	self owner color2: storedColor.
	self owner ifNotNil: [
		(self owner isKindOf: PaintPalette) ifTrue: [self owner updateOptionsPane]].
