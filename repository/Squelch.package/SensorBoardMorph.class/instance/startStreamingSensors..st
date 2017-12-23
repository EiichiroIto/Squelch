private
startStreamingSensors: sensorByte
	"Begin streaming data from the set of sensors specified by the bits of the given byte. Invoke this method with 0 to stop streaming. Incoming sensor data is processed by frequent calls to processIncomingData."

	| cmd |
	useGoGoProtocol ifFalse: [^ self].
	port flushInputBuffer.
	cmd := #(84 254 160 0) asByteArray.
	cmd at: 4 put: sensorByte.
	port nextPutAll: cmd.
