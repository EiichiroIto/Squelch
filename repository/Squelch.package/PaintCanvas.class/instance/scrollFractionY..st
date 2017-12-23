accessing
scrollFractionY: aNumber

	| total |
	total := canvasForm height - (self height // scale).
	scrollY := (aNumber * total) rounded min: canvasForm height max: 0.
	self changed.
