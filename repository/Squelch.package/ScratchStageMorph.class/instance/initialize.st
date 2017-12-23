initialization
initialize

	super initialize.
	color := Color white.
	self enableDragNDrop: true.
	objName := 'Stage' localized.
	costume := self defaultImageMedia.
	media := OrderedCollection with: costume with: SoundMedia new.
	zoom := 1.0.
	hPan := 0.
	vPan := 0.
	runningBlocks := OrderedCollection new.
	inProcessStep := false.
	sensorBoard := SensorBoardMorph new.
	midiPortNum := -1.
	notePlayerDict := Dictionary new.
	obsoleteSavedState := nil.
	sprites := OrderedCollection new.
	showMotorBlocks := false.
