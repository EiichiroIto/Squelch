object i/o
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		objName
		vars
		blocksBin
		isClone
		media
		costume
	) from: anObjStream.
