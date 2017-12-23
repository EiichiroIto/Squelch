list ops
addLettersOf: anObject

	anObject asString asUTF32 do: [:ch |
		cellMorphs addLast: (self createCell: (UTF32 with: ch) asUTF8)].

	self noteChangeAtIndex: cellMorphs size.
