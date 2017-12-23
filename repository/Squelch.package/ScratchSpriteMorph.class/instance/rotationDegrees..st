accessing
rotationDegrees: newRotationDegrees

	rotationDegrees ~= newRotationDegrees ifTrue: [
		rotationDegrees := newRotationDegrees asFloat \\ 360.0.
		(rotationStyle = #none) ifFalse: [
			self positionTalkBubble.
			self costumeChanged]].
