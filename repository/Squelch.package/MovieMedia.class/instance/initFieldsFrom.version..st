object i/o
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		fileName
		fade
		fadeColor
		zoom
		hPan
		vPan
		msecsPerFrame
		currentFrame
		moviePlaying
	) from: anObjStream.
	self openAfterLoad.
