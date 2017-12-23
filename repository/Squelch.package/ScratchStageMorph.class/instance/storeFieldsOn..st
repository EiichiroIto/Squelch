object i/o
storeFieldsOn: anObjStream

	super storeFieldsOn: anObjStream.
	self storeFieldsNamed: #(
		zoom
		hPan
		vPan
		obsoleteSavedState
		sprites
		volume
		tempoBPM
		sceneStates
		lists
	) on: anObjStream.
