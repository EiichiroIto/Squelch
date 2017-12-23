all
removeDuplicatedMissingGlyphs: originalGlyphs
	"Answer an array of glyphs that avoids duplicating the 'missing character' glyph, often a question mark."
	"Note: Assume that if the last glyph is not #missing and appears many times in the font then it's the 'missing character' glyph and should be replaced everywhere after it's first occurence with #missing."

	| missingGlyph firstI thisGlyph newGlyphs count |
	missingGlyph := originalGlyphs last.
	(missingGlyph isKindOf: Form) ifFalse: [^ originalGlyphs].
	firstI := (1 to: originalGlyphs size) detect: [:i |
		thisGlyph := originalGlyphs at: i.
		(thisGlyph isKindOf: Form) and:
		 [(missingGlyph extent = thisGlyph extent) and:
		 [missingGlyph bits = thisGlyph bits]]].
	firstI = originalGlyphs size ifTrue: [^ originalGlyphs].

	newGlyphs := originalGlyphs asArray copy.
	count := 0.
	firstI + 1 to: originalGlyphs size do: [:i |
		thisGlyph := originalGlyphs at: i.
		((thisGlyph isKindOf: Form) and:
		 [(missingGlyph extent = thisGlyph extent) and:
		 [missingGlyph bits = thisGlyph bits]]) ifTrue: [
			newGlyphs at: i put: #missing.
			count := count + 1]].
	Transcript show: 'Replaced ', count printString, ' missing glyphs'; cr.
	^ newGlyphs
