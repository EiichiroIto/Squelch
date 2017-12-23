sensor ops
stopReadingData
	"Turn off all motors, stop streaming data, and close the port."

	(port notNil and: [port isOpen]) ifTrue: [
		useGoGoProtocol ifTrue: [
			1 to: 6 do: [:motor | self turnOffMotor: motor].
			self startStreamingSensors: 0]].  "turn off streaming"
	self closePort.
