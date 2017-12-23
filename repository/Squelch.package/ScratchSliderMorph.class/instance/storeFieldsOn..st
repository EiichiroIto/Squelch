object i/o
storeFieldsOn: anObjStream

	super storeFieldsOn: anObjStream.
	self storeFieldsNamed: #(
		slider
		sliderMin
		sliderMax
		variable
	) on: anObjStream.
