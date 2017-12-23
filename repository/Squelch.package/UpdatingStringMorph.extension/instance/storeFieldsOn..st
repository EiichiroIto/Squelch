*Squelch
storeFieldsOn: anObjStream

	super storeFieldsOn: anObjStream.
	self storeFieldsNamed: #(
		format
		target
		getSelector
		putSelector
		parameter
		floatPrecision
		growable
		stepTime
	) on: anObjStream.
