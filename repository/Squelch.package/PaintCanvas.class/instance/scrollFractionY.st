accessing
scrollFractionY
	"Answer my vertical scroll fraction, a number between 0.0 and 1.0."

	| total |
	total := canvasForm height - (self height // scale).
	total <= 0.0 ifTrue: [^ 0.0].
	^ (scrollY asFloat / total) min: 1.0

