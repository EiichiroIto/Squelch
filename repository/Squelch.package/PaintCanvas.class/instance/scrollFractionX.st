accessing
scrollFractionX
	"Answer my horizontal scroll fraction, a number between 0.0 and 1.0."

	| total |
	total := canvasForm width - (self width // scale).
	total <= 0.0 ifTrue: [^ 0.0].
	^ (scrollX asFloat / total) min: 1.0

