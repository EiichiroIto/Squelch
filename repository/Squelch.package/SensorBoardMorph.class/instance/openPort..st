serial port
openPort: aString
	"Close the serial port if it is open, then open the port with the given name and initialize streaming of sensor data. Answer true if the operation was successful."

	| baudRate portNum numStart |
	baudRate := useGoGoProtocol ifTrue: [9600] ifFalse: [38400].
	self closePort.
	portName := aString.
	ScratchPlugin serialPortOpsAvailable
		ifTrue: [
			port := SerialPort2 new openPortNamed: portName baud: baudRate.
			port isOpen ifFalse: [port := nil. ^ false].
			port setOption: 20 to: 1.  "set DTR high"
			port setOption: 21 to: 0]  "set RTS low"
		ifFalse: [
			portNum := 1.
			numStart := (1 to: portName size) detect: [:i | (portName at: i) isDigit] ifNone: [0].
			numStart > 0 ifTrue: [portNum := (portName copyFrom: numStart to: portName size) asNumber].
			port := SerialPort new
				baudRate: baudRate;
				inputFlowControlType: 2;
				openPort: portNum ifFail: [^ false]].

	"initialize polling state"
	lastPollMSecs := Time millisecondClockValue.

	^ true
