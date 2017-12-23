event handling
mouseMove: evt

	resizeOffset ifNotNil: [
		self extent: (evt cursorPoint - self topLeft) + resizeOffset].
