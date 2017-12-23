event handling
keyboardFocusChange: aBoolean

	aBoolean
		ifTrue: [self color: Color yellow]
		ifFalse: [self color: Color gray].
