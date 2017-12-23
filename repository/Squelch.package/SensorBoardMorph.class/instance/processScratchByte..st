private
processScratchByte: aByte
	"Process one byte of the incoming data stream from a Scratch sensor board."
	"Sensor messages are two bytes with the following format:
		Byte1: <1><sensor number (4 bits)><sensor value high bits (3 bits)>
		Byte2: <0><sensor value low bits (7 bits)>"

	| sensorNum val |
	currentState = #idle ifTrue: [  "wait for first byte of message"
		(aByte bitAnd: 16r80) > 0 ifTrue: [
			currentState := #firstByteSeen.
			highByte := aByte].
		^ self].

	currentState = #firstByteSeen ifTrue: [
		(aByte bitAnd: 16r80) > 0 ifTrue: [  "must have lost second byte; stay in firstByteSeen state"
			highByte := aByte.
			^ self].

		"good second byte: report the sensor value"
		sensorNum := ((highByte bitShift: -3) bitAnd: 16rF) + 1.
		val := ((highByte bitAnd: 7) bitShift: 7) + (aByte bitAnd: 16r7F).
		sensorNum <= sensorValues size ifTrue: [
			sensorValues at: sensorNum put: val.
			sensorNum = 16 ifTrue: [
				(val == 3) | (val == 4) ifTrue: [
					scratchBoardV3 := true]]].  "ScratchBoard, version 3 or 4"

		currentState := #idle].
