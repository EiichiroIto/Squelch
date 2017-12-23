utilities
palettePaneColor

	| c |
	c := Color r: 124 g: 128 b: 131 range: 255.
	self isXO ifTrue: [c := c mixed: 0.75 with: Color white].
	^ c
