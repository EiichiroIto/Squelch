serial port
tryToOpenPort
	"Attempt to open the port. If successful, or if the port was open already, answer true. Otherwise, answer false."

	(port notNil and: [port isOpen and: [scanState = #on]]) ifTrue: [^ true].  "already open"
	self scanForPort.
	^ port notNil and: [port isOpen]
