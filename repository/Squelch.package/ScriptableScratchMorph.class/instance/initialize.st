initialization
initialize

	super initialize.
	objName := self nextInstanceName.
	vars := Dictionary new.
	lists := Dictionary new.
	blocksBin := ScratchScriptsMorph new.
	isClone := false.
	costume := self defaultImageMedia.
	media := OrderedCollection new.
	costumeChangeMSecs := 0.
	visibility := 100.
	volume := 100.
	tempoBPM := 60.
	sceneStates := Dictionary new.
