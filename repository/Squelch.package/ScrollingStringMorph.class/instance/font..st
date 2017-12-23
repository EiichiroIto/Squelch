accessing
font: aFont

	font := aFont.
	renderer := StringMorph new font: aFont.
	lineHeight := renderer stringHeight: ScratchTranslator renderHintString, 'Ag'.
	lineHeight = 0 ifTrue: [lineHeight := 10].  "workaround for possible bug in stringHeight:"
	layoutNeeded := true.
