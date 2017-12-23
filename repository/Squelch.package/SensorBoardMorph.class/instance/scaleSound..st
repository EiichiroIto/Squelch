private
scaleSound: val

	| n |
	n := ((val - 18) max: 0) min: 630.
	n < 50 ifTrue: [^ n / 2.0].  "0 to 25"
	^ 25.0 + ((n - 50) * (75.0 / 580.0))

