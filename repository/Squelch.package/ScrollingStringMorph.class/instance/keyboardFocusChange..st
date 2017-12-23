event handling
keyboardFocusChange: aBoolean

	hasFocus = aBoolean ifFalse: [
		self changed].
	hasFocus := aBoolean.
