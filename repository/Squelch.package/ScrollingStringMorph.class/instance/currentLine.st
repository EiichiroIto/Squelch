editing
currentLine
	"Answer the logical line containing the insertion point (i.e. all the character between two line breaks, independent of word wrap.)"

	| start end result |
	start := end := (self lineAndIndexFor: selectionStart) first.
	[(start > 1) and: [(lines at: start - 1) last ~= Character cr]] whileTrue: [start := start - 1].
	[(end < lines size) and: [(lines at: end)  last ~= Character cr]] whileTrue: [end := end + 1].

	result := ''.
	start to: end do: [:i | result := result, (lines at: i)].
	^ result