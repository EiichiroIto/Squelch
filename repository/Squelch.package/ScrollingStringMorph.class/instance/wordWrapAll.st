private
wordWrapAll
	"Redo my wordwrap."

	self contents: self contents.
	self lineWrapFrom: 1.
	self updateScrollbar.
