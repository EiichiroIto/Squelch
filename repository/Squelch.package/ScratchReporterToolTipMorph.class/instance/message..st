accessing
message: aString

	| verts |
	super message: aString.
	ScratchTranslator isRTL
		ifFalse: [verts := (Array
			with: self bottomLeft + (2@6)
			with: self bottomLeft + (5@0)
			with: self bottomLeft + (10@0))]
		ifTrue: [verts := (Array
			with: self bottomRight - (2@0) + (0@6)
			with: self bottomRight - (5@0)
			with: self bottomRight - (10@0))].
	self addMorph: (PolygonMorph
		vertices: verts
		color: (Color r: 0.9 g: 0.9 b: 0.9)
		borderWidth: 0
		borderColor: Color yellow).
