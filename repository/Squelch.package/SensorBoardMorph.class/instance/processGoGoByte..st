private
processGoGoByte: aByte
	"Process one byte of the incoming data stream from a GoGoBoard."
	"Details: This code recognizes three-byte sensor update messages starting with 16r0C using a simple, three-state finite state machine. We assume that sensor updates are always contiguous--that is, replies to motor or other GoGo board commands will not be inserted between the bytes of any given three-byte sensor update message. The sensor number is the top three bits of the byte two. The data value is the bottom two bits of byte two plus all eight bits of byte three."

	| sensorNum val |
	currentState = #idle ifTrue: [ 
		aByte = 16r0C ifTrue: [currentState := #startByteSeen].
		^ self].

	currentState = #startByteSeen ifTrue: [
		highByte := aByte.
		currentState := #highByteSeen.
		^ self].

	currentState = #highByteSeen ifTrue: [
		"final byte of message: report the sensor value"
		sensorNum := (highByte bitShift: -5) + 1.
		val := ((highByte bitAnd: 3) bitShift: 8) + aByte.
		(sensorNum between: 1 and: 8) ifTrue: [
			sensorValues at: sensorNum put: val].
		currentState := #idle].
