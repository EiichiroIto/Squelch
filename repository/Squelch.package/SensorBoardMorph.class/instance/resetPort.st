serial port
resetPort
	"If the port is closed, do nothing. If it is open, close and reopen it. This can be used to reset the Prolific USB serial driver if it misbehaves."

	self portIsOpen ifFalse: [^ self].
	portName ifNil: [^ self].
	self closePort.
	self openPort: portName.
	scanState := #on.
	self step.
