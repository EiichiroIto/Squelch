accessing
adjustedCursorPoint
	"Answer the current mouse cursorPoint, possibly adjusted for the scaling in 2x presentation mode."

	^ DoubleSize
		ifTrue: [((Sensor cursorPoint - self center) // 2) + self center]
		ifFalse: [Sensor cursorPoint]
