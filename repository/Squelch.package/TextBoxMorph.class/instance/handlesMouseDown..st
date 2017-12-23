event handling
handlesMouseDown: evt

	^ ((self bounds insetBy: 17) containsPoint: evt cursorPoint) not