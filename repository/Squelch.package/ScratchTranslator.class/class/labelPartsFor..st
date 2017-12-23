language translation
labelPartsFor: aString
	"Answer a collection label strings for the translation of given block label. Currently handles one or two-part labels. In a two-part label, the label is split at the field name begginning with a percent sign. For example, 'when %s clicked' would yield the two label parts 'when' and 'clicked'."

	| s i p1 p2 |
	s := ScratchTranslator translationFor: aString.
	i := s indexOf: $% ifAbsent: [^ Array with: s with: ''].
	p1 := (s copyFrom: 1 to: i - 1) trimBoth.
	p2 := (s copyFrom: i + 2 to: s size) trimBoth.
	^ Array with: p1 with: p2
