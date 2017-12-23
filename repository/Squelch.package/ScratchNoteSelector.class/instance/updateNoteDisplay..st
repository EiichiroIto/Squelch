private
updateNoteDisplay: noteNum

	| s |
	s := #('C' 'C#' 'D' 'Eb' 'E' 'F' 'F#' 'G' 'G#' 'A' 'Bb' 'B') at: ((noteNum rem: 12) + 1).
	labelMorph
		contents: s, ' (' , noteNum asString, ')';
		centerInOwner.
