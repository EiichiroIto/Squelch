accessing
scrollFractionX: aNumber

	| total |
	total := canvasForm width - (self width // scale).
	scrollX := (aNumber * total) rounded min: canvasForm width max: 0.
	self changed.
