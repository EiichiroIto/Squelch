pen ops
setPenShadeTo: aNumber
	"Set the pen shade (lightness) to given number between 0 and 100. A shade of 0 is black, 100 is white, and 50 is fully saturated color."
	"Details: We don't want to get all the way to pure black or white, so we divide the range 0..50 by a number > 50 when computing the fraction of the original color to mix with black or white."

	| normalizeShade scale k |
	penShade := aNumber asFloat \\ 200.0.
	penColor := Color h: (360.0 * penHue) / 200.0 s: 1.0 v: 1.0.
	normalizeShade := penShade > 100.0 ifTrue: [200.0 - penShade] ifFalse: [penShade].

	normalizeShade = 50.0 ifTrue: [^ self].  "pure color"

	scale := 1.0 / 60.0.
	k := 1.0 - (50.0 * scale).
	normalizeShade < 50.0 ifTrue: [
		penColor := penColor mixed: (scale * normalizeShade) + k with: Color black].
	normalizeShade > 50.0 ifTrue: [
		penColor := penColor mixed: 1.0 - (scale * (normalizeShade - 50.0)) with: Color white].
