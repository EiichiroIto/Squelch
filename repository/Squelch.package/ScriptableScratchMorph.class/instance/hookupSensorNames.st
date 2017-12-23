sensing ops
hookupSensorNames

	| sensorNames stage virtualSensors |
	sensorNames := #(
		'slider'
		'light'
		'sound'
		'resistance'
	).

	sensorNames := sensorNames, #('-' 'tilt' 'distance'). "WeDo sensors"

	(stage := self meOrOwnerThatIsA: ScratchStageMorph) ifNotNil: [
		stage scratchServer ifNotNil: [
			virtualSensors := stage scratchServer sensorNames.
			virtualSensors size > 0 ifTrue: [
				^ sensorNames, {'-'}, stage scratchServer sensorNames]]].

	^ sensorNames
