initialization
getCopyButton

	| b |
	b := ScratchFrameMorph buttonLabel: 'Copy' localized selector: #duplicateMedia.
	b target: self.
	^ b
