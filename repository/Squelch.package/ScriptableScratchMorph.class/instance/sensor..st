sensing ops
sensor: sensorName
	"Answer the value of the given sensor, or zero if the sensorboard is not available."

	| stage v sb |
	(stage := self ownerThatIsA: ScratchStageMorph) ifNil: [^ 0].
	stage scratchServer ifNotNil: [
		v := stage scratchServer sensorValueFor: sensorName.
		v ifNotNil: [^ v]].

	'tilt' = sensorName ifTrue: [^ WeDoPlugin tilt].
	'distance' = sensorName ifTrue: [^ WeDoPlugin distance].

	sb := stage sensorBoard.
	sb tryToOpenPort ifFalse: [^ 0].  "could not open"
	^ sb sensor: (self indexForSensorName: sensorName)
