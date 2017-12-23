stepping
step

	layoutNeeded ifTrue: [
		self wordWrapAll.
		layoutNeeded := false].

	blinkState := blinkState not.
	selectionStart = selectionEnd ifTrue: [self changed].
