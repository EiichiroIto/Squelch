editing
paste
	"Paste the last cut or copied text over the current selection."

	| s |
	s := ScratchTranslator unicodeClipboard.
	s size = 0 ifTrue: [^ self].

	self deleteSelection.
	self insertString: s.
