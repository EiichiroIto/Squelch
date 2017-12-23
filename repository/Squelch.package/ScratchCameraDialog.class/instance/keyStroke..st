event handling
keyStroke: evt

	| ch |
	ch := evt unicodeChar.
	ch = 0 ifTrue: [ch := evt keyValue].

	ch = 32 ifTrue: [  "space key"
		self savePhoto.
		^ self].

	ch = 27 ifTrue: [  "escape key"
		self escapeKeyPressed: evt.
		^ self].

