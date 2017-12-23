*Squelch
storeFieldsOn: anObjStream

	super storeFieldsOn: anObjStream.
	self storeFieldsNamed: #(
		target
		arguments
		minVal
		maxVal
		truncate
		sliderThickness
	) on: anObjStream.
