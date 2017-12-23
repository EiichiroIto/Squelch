all
glyphAfter: startX in: lineForm
	"Answer a pair containing the starting and ending x positions of the next glyph after the given x offset in the given Form. Answer #missing if the glyph is missing or nil if there are no more marks in the line. Assume startX is the first position after the previous marker."

	| h pair nextMark glyphStart glyphEnd |
	h := lineForm height.
	pair := self markAfter: startX in: lineForm.
	pair ifNil: [^ nil].

	nextMark := lineForm copy: (pair first@0 corner: pair last@h).
	(self isMarker: nextMark) ifTrue: [  "is there enough space for this to be the next marker?"
		(pair first - startX) >= (3 * spaceWidth) ifTrue: [^ #missing]].

	glyphStart := pair first.
	glyphEnd := pair last.
	[true] whileTrue: [
		"examine the next mark"
		pair := self markAfter: glyphEnd + 1 in: lineForm.
		pair ifNil: [^ Array with: glyphStart with: glyphEnd].  "end of line"
		nextMark := lineForm copy: (pair first@0 corner: pair last@h).
		((self isMarker: nextMark) and:
		 [(pair first - glyphEnd) > spaceWidth])
			ifTrue: [^ Array with: glyphStart with: glyphEnd].  "found next marker"
		glyphEnd := pair last].  "extend the glyph to include this mark"
