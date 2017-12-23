*Squelch
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		target
		arguments
		minVal
		maxVal
		truncate
		sliderThickness
	) from: anObjStream.
