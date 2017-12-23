event handling
mouseMove: evt

	| p |
	draggingDirection ifFalse: [^ self].
	(target respondsTo: #rotationDegrees:) ifFalse: [^ self].
	p := evt cursorPoint - self center.
	p r > 0 ifTrue: [target rotationDegrees: p theta radiansToDegrees rounded].
	self updateThumbnail.
