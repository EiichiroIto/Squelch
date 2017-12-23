private
scaleLight: val

	val <= 25 ifTrue: [^ 100 - val].
	^ ((1023 - val) * (75.0 / 998)) rounded
