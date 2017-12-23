sensing ops
indexForSensorName: sensorName
	"Answer the index for the given sensor name."

	sensorName startsWithDigit ifTrue: [^ sensorName asNumberNoError].

	'slider' = sensorName		ifTrue: [^ 1].
	'light' = sensorName			ifTrue: [^ 2].
	'sound' = sensorName		ifTrue: [^ 3].
	(sensorName includesSubString: 'button') ifTrue: [^ 4].
	(sensorName includes: $A)	ifTrue: [^ 5].
	(sensorName includes: $B)	ifTrue: [^ 6].
	(sensorName includes: $C)	ifTrue: [^ 7].
	(sensorName includes: $D)	ifTrue: [^ 8].

	^ 1
