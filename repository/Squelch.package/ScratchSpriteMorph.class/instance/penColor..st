pen ops
penColor: aColor
	"Set my pen color."

	| b |
	penColor := aColor.
	penHue := (penColor hue * 200.0) / 360.0.
	b := penColor brightness.
	b = 1.0
		ifTrue: [penShade := 50.0 + (50.0 * (1.0 - penColor saturation))]
		ifFalse: [penShade := 50.0 * b].
