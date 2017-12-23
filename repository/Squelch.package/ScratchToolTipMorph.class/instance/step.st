stepping
step

	initialCursorPoint ifNotNil: [
		(Sensor cursorPoint - initialCursorPoint) r > 80 ifTrue: [
			target ifNotNil: [target setProperty: #toolTip toValue: nil].
			self delete]].
