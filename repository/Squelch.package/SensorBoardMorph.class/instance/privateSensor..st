sensor ops
privateSensor: sensorIndex
	"Read the virtual sensor with the given index permuted according to which Scratch board is plugged in and scaled if it is a known special sensor such as the light or sound sensor. If reportRaw is true then the raw sensor value (0..1023) is reported."
	"This method does not call processIncomingData. It should only be used by the step method."

	| i raw |
	"map the sensor index to the corresponding channel"
	i := (sensorIndex asInteger max: 1) min: 8.
	useGoGoProtocol ifFalse: [
		scratchBoardV3
			ifTrue: [i := #(8 6 7 4 5 3 2 1) at: i] 
			ifFalse: [i := #(5 6 7 8 1 2 3 4) at: i]].

	raw := sensorValues at: i.
	reportRaw ifTrue: [^ raw].
	scratchBoardV3 ifTrue: [
		i = 6 ifTrue: [^ self scaleLight: raw].
		i = 7 ifTrue: [^ self scaleSound: raw]].
	raw > 1020 ifTrue: [raw := 1023].  "avoids jitter in the range 1021-1023"
	^ (100.0 * raw) / 1023.0  
