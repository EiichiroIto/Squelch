editing
moveCursorToStartOfNextLine
	"Position the cursor at start of the next line. Insert a CR if this is the last line and it doesn't end in one."

	| i |
	self moveCursorEndAndSelect: false.
	selectionStart := selectionEnd := selectionStart + 1.
	i := (self lineAndIndexFor: selectionStart) first.
	i = lines size ifTrue: [
		(((lines at: i) size = 0) or:
		 [(lines at: i) last ~= Character cr]) ifTrue: [
			selectionStart := selectionEnd := self charCount + 1.
			self insertString: String cr]].
