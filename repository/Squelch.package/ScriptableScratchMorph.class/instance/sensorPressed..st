sensing ops
sensorPressed: sensorName
	"Answer true if a button connected to the given input of the sensor board is pressed. That is, if the sensor value is less than 10. Answer false if the sensor board cannot be opened."

	| stage sb |
	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNil: [^ false].
	sb := stage sensorBoard.
	sb tryToOpenPort ifFalse: [^ false].  "could not open"
	^ (sb sensor: (self indexForSensorName: sensorName)) < 10
