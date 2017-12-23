event handling
startDrag: evt

	self world ifNil: [^ self].  "don't pick me up if in presentation mode"
	lastPosition := self position.
	super startDrag: evt.
