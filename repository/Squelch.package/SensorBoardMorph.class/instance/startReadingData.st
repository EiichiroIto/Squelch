sensor ops
startReadingData
	"Ensure that the serial port is open, turn off all motors and put them into a known state, and begin streaming sensor data."

	self portIsOpen ifFalse: [^ self].  "could not open the serial port"

	currentState := #idle.
	sensorValues atAllPut: 0.
	scratchBoardV3 := false.
	self startStreamingSensors: 0.  "in case board was left in streaming mode"
	port flushInputBuffer.

	useGoGoProtocol ifTrue: [
		1 to: 6 do: [:motor |
			self turnOffMotor: motor.
			self thisWayMotor: motor.
			self setPower: 3 motor: motor.
			self turnOffMotor: motor].
		self startStreamingSensors: 16rFF].  "all 8 sensors"
