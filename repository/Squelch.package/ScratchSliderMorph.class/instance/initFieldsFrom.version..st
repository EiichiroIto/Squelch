object i/o
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		slider
		sliderMin
		sliderMax
		variable
	) from: anObjStream.
