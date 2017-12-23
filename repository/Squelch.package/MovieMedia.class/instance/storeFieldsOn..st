object i/o
storeFieldsOn: anObjStream

	super storeFieldsOn: anObjStream.
	self storeFieldsNamed: #(
		fileName
		fade
		fadeColor
		zoom
		hPan
		vPan
		msecsPerFrame
		currentFrame
		moviePlaying
	) on: anObjStream.
