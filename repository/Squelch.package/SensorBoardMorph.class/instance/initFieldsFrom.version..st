object i/o
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	anObjStream nextField.  "skip old portNum field"
	self addReadouts.
