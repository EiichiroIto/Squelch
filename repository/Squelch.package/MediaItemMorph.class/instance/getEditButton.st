initialization
getEditButton

	| b |
	b := ScratchFrameMorph buttonLabel: 'Edit' localized selector: #editMedia.
	b target: self.
	^ b
