serial port
scanForPort
	"Try to find the serial port that the sensor board is attached to. This is incremental--each time it is called it does the next task."
	"Details: scanState is one of: #(off, start, checkData, on). scanPorts is a list of port names to try. Attempt to open each port in turn, then wait for a while and see if Scratch Sensor data of the right form has arrived."

	| msecs buf i |
	#off = scanState ifTrue: [self scanNextPort].

	#on = scanState ifTrue: [  "if port is open, close it and start a new scan"
		scanPorts := nil.
		self scanNextPort].

	#start = scanState ifTrue: [
		(scanPorts isNil or: [scanPorts size = 0]) ifTrue: [
			scanPorts := self portNames asOrderedCollection].
		scanPorts size = 0 ifTrue: [^ self scanNextPort].
		self openPort: scanPorts removeFirst.
		self portIsOpen ifFalse: [^ self].
		scanState := #checkData.
		scanStartMSecs := Time millisecondClockValue.
		^ self].

	#checkData = scanState ifTrue: [
		msecs := Time millisecondClockValue - scanStartMSecs.
		(self portIsOpen not or: [msecs > 4000]) ifTrue: [^ self scanNextPort].
		port nextPut: 1.  "send poll byte"
		((buf := port readByteArray) size < 10) ifTrue: [^ self].  "no data yet"

		"check that the data is in Scratch Sensor Board format"
		i := (buf first bitAnd: 128) > 0 ifTrue: [1] ifFalse: [2].
		[i < (buf size - 1)] whileTrue: [
			(((buf at: i) bitAnd: 128) > 0 and:
			 [((buf at: i + 1) bitAnd: 128) = 0]) ifFalse: [^ self scanNextPort].
			i := i + 2].

		scanState := #on].
