accessing
heading
	"Answer my heading in degrees, a number between -180 and 180."

	| result |
	result := rotationDegrees + 90.
	result > 180 ifTrue: [result := result - 360].
	^ result

