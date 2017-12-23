all
computeMetricsFrom: aForm
	"Compute the width of a space character. Also compute the pixel offset from the right edge of a period to the edge of the next character from the given line form (typically the first line of the strike file). These metrics are used to extract the characters from subsequent lines. Finally, record the marker (period) form for use during line scanning."
	"Details: The first line contains four printing characters intermixed with space characters:
		.<space>.<space><space>.<space>x
	The difference in spacing between the first/second and second/third periods gives the width of a space character. The space between the last period and the start of the 'x' is the character start offset."

	| glyphPairs markerPair d1 |
	spaceWidth := 0.
	glyphPairs := self glyphStartsAndStopsFrom: aForm.
	glyphPairs size = 4 ifFalse: [self error: 'implementation problem'].
	markerPair := glyphPairs first.
	markerGlyph := aForm copy: (markerPair first@0 extent: (markerPair last + 1 - markerPair first)@aForm height).
	d1 := (glyphPairs at: 2) first - ((glyphPairs at: 1) last + 1).
	basePix := (glyphPairs at: 3) first - ((glyphPairs at: 2) last + 1).
	spaceWidth := basePix - d1.
	charOffset := (glyphPairs at: 4) first - ((glyphPairs at: 3) last + 1).
