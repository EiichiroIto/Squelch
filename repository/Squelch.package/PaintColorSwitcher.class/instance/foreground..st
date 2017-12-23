accessing
foreground: aColor

	| t |
	foreground color: aColor.
	foreground removeAllMorphs.
	aColor = Color transparent ifTrue: [
		t := transparentMorph fullCopy.
		foreground addMorph: t.
		t position: (foreground position + (1@1))].

	self owner ifNotNil: [
		(self owner isKindOf: PaintPalette) ifTrue: [self owner updateOptionsPane]].
