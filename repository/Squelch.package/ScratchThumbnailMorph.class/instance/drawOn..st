drawing
drawOn: aCanvas

	| offset |
	super drawOn: aCanvas.
	(target respondsTo: #rotationDegrees:) ifFalse: [^ self].  "nil or background"
	showDirection ifTrue: [
		offset := Point r: (self width / 2) - 1 degrees: target rotationDegrees.
		aCanvas line: self center to: self center + offset width: 1 color: Color blue].

