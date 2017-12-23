event handling
mouseMove: evt

	dragOffset ifNotNil: [self scrollAbsolute: evt].
