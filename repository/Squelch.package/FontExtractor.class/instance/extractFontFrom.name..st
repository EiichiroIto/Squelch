all
extractFontFrom: aForm name: aString
	"Answer a StrikeFont for the font extracted from the given Form."
	"FontExtractor new extractFontFrom: (Form fromFileNamed: 'Palatino24.gif')"

	| r glyphs spaceGlyph |
	"reduce depth and trim the strike form"
	strikeForm := Form extent: aForm extent depth: 1.
	strikeForm copy: strikeForm boundingBox from: 0@0 in: aForm rule: Form over.
	r := strikeForm rectangleEnclosingPixelsNotOfColor: (strikeForm colorAt: 0@0).
	strikeForm := strikeForm copy: (r origin extent: r width@(r height + 1)).

	self extractLines.
	self computeMetricsFrom: lineForms first.

	spaceGlyph := (Form extent: (spaceWidth - 2)@fontHeight depth: 1) fillWhite.
	glyphs := OrderedCollection new.
	glyphs add: spaceGlyph.
	2 to: lineForms size do: [:i | glyphs addAll: (self glyphsForLine: i)].
	"self inform: ((1 to: lineForms size) collect: [:i | (self glyphsForLine: i) size]) printString."
	glyphs := self removeDuplicatedMissingGlyphs: glyphs.
	^ StrikeFont new
		initForms: glyphs firstAscii: 32 ascent: fontAscent;
		name: aString
