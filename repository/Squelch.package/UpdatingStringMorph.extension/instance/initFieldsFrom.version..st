*Squelch
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		format
		target
		getSelector
		putSelector
		parameter
		floatPrecision
		growable
		stepTime
	) from: anObjStream.
