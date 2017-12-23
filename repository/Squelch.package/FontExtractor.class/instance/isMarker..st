all
isMarker: aForm

	aForm width = markerGlyph width ifFalse: [^ false].
	^ aForm bits = markerGlyph bits
