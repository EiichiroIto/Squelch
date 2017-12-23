all
glyphsForLine: lineIndex
	"Answer an Array whose elements are the character glyphs for the line with the given index. If a glyph is missing from the font, the entry for that character is the symbol #missing."

	| result lineForm h markerPair glyphPair |
	result := OrderedCollection new.
	lineForm := lineForms at: lineIndex.
	h := lineForm height.

	"read the first marker"
	markerPair := self markAfter: 0 in: lineForm.

	"at the start of each loop iteration, markerPair contains the start and end of the last marker"
	"the loop terminates when the next markerPair or glyphPair is nil (indicating the end of the line)"
	[true] whileTrue: [
		markerPair ifNil: [^ result asArray].
		self assert: [self isMarker: (lineForm copy: (markerPair first@0 corner: markerPair last@h))].
		glyphPair := self glyphAfter: (markerPair last + 1) in: lineForm.
		glyphPair ifNil: [^ result asArray].
		#missing = glyphPair
			ifTrue: [
				result addLast: #missing.
				markerPair := self markAfter: (markerPair last + 1) in: lineForm]
			ifFalse: [
				result addLast: (lineForm copy: (glyphPair first@0 corner: glyphPair last@h)).
				markerPair := self markAfter: glyphPair last + 1 in: lineForm]].

