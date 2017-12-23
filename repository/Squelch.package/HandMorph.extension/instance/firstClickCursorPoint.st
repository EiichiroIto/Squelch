*Squelch
firstClickCursorPoint
	mouseClickState ifNil: [ ^ nil ].
	^ mouseClickState cursorPoint